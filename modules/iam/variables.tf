variable "project_name" {
  type        = string
  description = "Name of the project"
}

variable "environment" {
  type        = string
  description = "Deployment environment"
}

variable "bronze_bucket_arn" {
  type        = string
  description = "ARN of the Bronze S3 bucket"
}

variable "silver_bucket_arn" {
  type        = string
  description = "ARN of the Silver S3 bucket"
}

variable "gold_bucket_arn" {
  type        = string
  description = "ARN of the Gold S3 bucket"
}
variable "glue_database_arn" {
  type        = string
  description = "ARN of the Glue Catalog database"
}
variable "cloudwatch_log_group_arn" {
  type        = string
  description = "ARN of the CloudWatch log group"
}