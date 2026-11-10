resource "aws_iam_role" "glue_role" {
  name = "${var.project_name}-${var.environment}-glue-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "glue.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_iam_policy" "glue_s3_policy" {
  name        = "${var.project_name}-${var.environment}-glue-s3-policy"
  description = "S3, Glue Catalog and CloudWatch permissions for AWS Glue"

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      # 1. S3 bucket listing permissions
      {
        Effect = "Allow"

        Action = [
          "s3:ListBucket"
        ]

        Resource = [
          var.bronze_bucket_arn,
          var.silver_bucket_arn,
          var.gold_bucket_arn
        ]
      },

      # 2. Read access to Bronze and Silver objects
      {
        Effect = "Allow"

        Action = [
          "s3:GetObject"
        ]

        Resource = [
          "${var.bronze_bucket_arn}/*",
          "${var.silver_bucket_arn}/*"
        ]
      },

      # 3. Write access to Silver and Gold objects
      {
        Effect = "Allow"

        Action = [
          "s3:PutObject"
        ]

        Resource = [
          "${var.silver_bucket_arn}/*",
          "${var.gold_bucket_arn}/*"
        ]
      },

      # 4. Glue database permissions
      {
        Effect = "Allow"

        Action = [
          "glue:GetDatabase"
        ]

        Resource = [
          var.glue_database_arn
        ]
      },

      # 5. Glue table and partition permissions
      {
        Effect = "Allow"

        Action = [
          "glue:GetTable",
          "glue:GetTables",
          "glue:CreateTable",
          "glue:UpdateTable",
          "glue:GetPartition",
          "glue:GetPartitions",
          "glue:BatchGetPartition",
          "glue:CreatePartition",
          "glue:UpdatePartition",
          "glue:BatchCreatePartition"
        ]

        Resource = [
          var.glue_database_arn,
          "${replace(var.glue_database_arn, ":database/", ":table/")}/*"
        ]
      },

      # 6. CloudWatch logging permissions
      {
        Effect = "Allow"

        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]

        Resource = var.cloudwatch_log_group_arn
      }
    ]
  })
}

# Attach the custom policy to the Glue IAM role
resource "aws_iam_role_policy_attachment" "glue_s3_attachment" {
  role       = aws_iam_role.glue_role.name
  policy_arn = aws_iam_policy.glue_s3_policy.arn
}
resource "aws_iam_role_policy_attachment" "glue_service_attachment" {
  role       = aws_iam_role.glue_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
}