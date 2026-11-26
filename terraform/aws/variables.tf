variable "aws_region" {
  description = "AWS region for all resources"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "Dev"
}

variable "project" {
  description = "Project name used for tagging"
  type        = string
  default     = "ClaudeCodeLab"
}

variable "owner" {
  description = "Owner name used for tagging"
  type        = string
  default     = "DiegoRojas"
}

variable "allowed_ip" {
  description = "Source CIDR allowed for SSH and RDP (parametrizable, e.g. 203.0.113.10/32)"
  type        = string
  default     = "0.0.0.0/32"
}

variable "availability_zone" {
  description = "Availability zone for the public subnet"
  type        = string
  default     = "us-east-1a"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0c02fb55956c7d316"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Name of the existing EC2 key pair for SSH"
  type        = string
  sensitive   = true
}

variable "s3_bucket_name" {
  description = "Globally unique S3 bucket name for the static website"
  type        = string
  default     = "claudecodelab-static-website"
}
