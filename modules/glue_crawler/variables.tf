variable "project_name" {
  type        = string
  description = "Name of the project"
}

variable "environment" {
  type        = string
  description = "Deployment environment"
}

variable "database_name" {
  type        = string
  description = "Glue Catalog database name"
}

variable "glue_role_arn" {
  type        = string
  description = "IAM role ARN for AWS Glue Crawler"
}

variable "bronze_bucket_name" {
  type        = string
  description = "Bronze S3 bucket name"
}