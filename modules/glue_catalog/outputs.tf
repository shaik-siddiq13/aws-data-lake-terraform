output "database_name" {
  description = "AWS Glue Catalog database name"
  value       = aws_glue_catalog_database.this.name
}

output "database_id" {
  description = "AWS Glue Catalog database ID"
  value       = aws_glue_catalog_database.this.id
}
output "database_arn" {
  description = "ARN of the AWS Glue Catalog database"
  value       = aws_glue_catalog_database.this.arn
}