output "crawler_name" {
  description = "AWS Glue Crawler name"
  value       = aws_glue_crawler.bronze_crawler.name
}

output "crawler_arn" {
  description = "AWS Glue Crawler ARN"
  value       = aws_glue_crawler.bronze_crawler.arn
}