variable "project_name" {
  type        = string
  description = "Name of the project"
  default     = "aws-data-lake"
}

variable "environment" {
  type        = string
  description = "Deployment environment"
  default     = "dev"

  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "Environment must be dev, test, or prod."
  }
}

variable "aws_region" {
  type        = string
  description = "AWS region for deployment"
  default     = "ap-south-1"
}

variable "bucket_suffix" {
  type        = string
  description = "Unique suffix for S3 bucket names"
}