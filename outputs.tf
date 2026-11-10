output "bucket_prefix" {
  description = "Common prefix used for Data Lake S3 buckets"
  value       = local.bucket_prefix
}

output "bronze_bucket_name" {
  description = "Bronze layer S3 bucket name"
  value       = module.bronze_bucket.bucket_id
}

output "silver_bucket_name" {
  description = "Silver layer S3 bucket name"
  value       = module.silver_bucket.bucket_id
}

output "gold_bucket_name" {
  description = "Gold layer S3 bucket name"
  value       = module.gold_bucket.bucket_id
}

output "glue_role_name" {
  description = "Name of the AWS Glue IAM role"
  value       = module.glue_iam.glue_role_name
}

output "glue_role_arn" {
  description = "ARN of the AWS Glue IAM role"
  value       = module.glue_iam.glue_role_arn
}
output "cloudwatch_log_group_name" {
  description = "CloudWatch log group name"
  value       = module.cloudwatch.log_group_name
}

output "cloudwatch_log_group_arn" {
  description = "CloudWatch log group ARN"
  value       = module.cloudwatch.log_group_arn
}
output "glue_catalog_database_name" {
  description = "Glue Catalog database name"
  value       = module.glue_catalog.database_name
}

output "glue_catalog_database_id" {
  description = "Glue Catalog database ID"
  value       = module.glue_catalog.database_id
}

output "glue_crawler_name" {
  description = "AWS Glue Crawler name"
  value       = module.glue_crawler.crawler_name
}

output "glue_crawler_arn" {
  description = "AWS Glue Crawler ARN"
  value       = module.glue_crawler.crawler_arn
}