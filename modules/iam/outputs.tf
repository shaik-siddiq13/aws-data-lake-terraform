output "glue_role_name" {
  description = "Name of the AWS Glue IAM role"
  value       = aws_iam_role.glue_role.name
}

output "glue_role_arn" {
  description = "ARN of the AWS Glue IAM role"
  value       = aws_iam_role.glue_role.arn
}