output "vpc_id" {
  description = "ID of the VPC"
  value       = module.networking.vpc_id
}

output "subnet_id" {
  description = "ID of the public subnet"
  value       = module.networking.subnet_id
}

output "security_group_id" {
  description = "ID of the Security Group"
  value       = module.networking.security_group_id
}

output "ec2_instance_id" {
  description = "ID of the EC2 instance"
  value       = module.compute.instance_id
}

output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = module.compute.public_ip
}

output "s3_website_endpoint" {
  description = "Static website endpoint"
  value       = module.storage.website_endpoint
}

output "s3_bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = module.storage.bucket_arn
}
