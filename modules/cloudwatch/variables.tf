variable "project_name" {
  type        = string
  description = "Name of the project"
}

variable "environment" {
  type        = string
  description = "Deployment environment"
}

variable "retention_in_days" {
  type        = number
  description = "Number of days to retain CloudWatch logs"
  default     = 30
}