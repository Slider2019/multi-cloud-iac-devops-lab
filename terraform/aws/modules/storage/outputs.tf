output "bucket_id" {
  description = "ID (name) of the S3 bucket"
  value       = aws_s3_bucket.this.id
}

output "bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.this.arn
}

output "website_endpoint" {
  description = "Static website endpoint URL"
  value       = aws_s3_bucket_website_configuration.this.website_endpoint
}
