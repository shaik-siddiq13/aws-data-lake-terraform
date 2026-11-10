resource "aws_glue_crawler" "bronze_crawler" {
  name          = "${var.project_name}-${var.environment}-bronze-crawler"
  database_name = var.database_name
  role          = var.glue_role_arn

  s3_target {
    path = "s3://${var.bronze_bucket_name}/"
  }

  description = "Crawler for discovering Bronze layer data"

  tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}