variable "vpc_name" {
  description = "Name tag for the VPC"
  type        = string
  default     = "vpc-claudecode"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.1.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.1.1.0/24"
}

variable "availability_zone" {
  description = "Availability zone for the subnet"
  type        = string
  default     = "us-east-1a"
}

variable "allowed_ip" {
  description = "Source CIDR allowed for SSH and RDP (parametrizable)"
  type        = string
  default     = "0.0.0.0/32"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}
