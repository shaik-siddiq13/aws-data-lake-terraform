resource "aws_glue_catalog_database" "this" {
  name = "${var.project_name}_${var.environment}_catalog"

  description = "AWS Glue Data Catalog database for the Data Lake project"
}