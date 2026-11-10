locals {
  bucket_prefix = "${var.project_name}-${var.environment}-${var.bucket_suffix}"
}

module "bronze_bucket" {
  source = "./modules/s3"

  bucket_name  = "${local.bucket_prefix}-bronze"
  environment  = var.environment
  project_name = var.project_name
}

module "silver_bucket" {
  source = "./modules/s3"

  bucket_name  = "${local.bucket_prefix}-silver"
  environment  = var.environment
  project_name = var.project_name
}

module "gold_bucket" {
  source = "./modules/s3"

  bucket_name  = "${local.bucket_prefix}-gold"
  environment  = var.environment
  project_name = var.project_name
}

module "glue_iam" {
  source = "./modules/iam"

  project_name = var.project_name
  environment  = var.environment

  bronze_bucket_arn        = module.bronze_bucket.bucket_arn
  silver_bucket_arn        = module.silver_bucket.bucket_arn
  gold_bucket_arn          = module.gold_bucket.bucket_arn
  glue_database_arn        = module.glue_catalog.database_arn
  cloudwatch_log_group_arn = module.cloudwatch.log_group_arn
}

module "cloudwatch" {
  source = "./modules/cloudwatch"

  project_name      = var.project_name
  environment       = var.environment
  retention_in_days = 30
}

module "glue_catalog" {
  source = "./modules/glue_catalog"

  project_name = var.project_name
  environment  = var.environment
}

module "glue_crawler" {
  source = "./modules/glue_crawler"

  project_name = var.project_name
  environment  = var.environment

  database_name      = module.glue_catalog.database_name
  glue_role_arn      = module.glue_iam.glue_role_arn
  bronze_bucket_name = module.bronze_bucket.bucket_id
}