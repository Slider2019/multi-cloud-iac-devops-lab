locals {
  tags = {
    Environment = var.environment
    Project     = var.project
    Owner       = var.owner
    ManagedBy   = "Terraform"
  }
}

module "networking" {
  source = "./modules/networking"

  vpc_name          = "vpc-claudecode"
  vpc_cidr          = "10.1.0.0/16"
  subnet_cidr       = "10.1.1.0/24"
  availability_zone = var.availability_zone
  allowed_ip        = var.allowed_ip
  tags              = local.tags
}

module "compute" {
  source = "./modules/compute"

  instance_name      = "vmclaudecode"
  instance_type      = var.instance_type
  ami_id             = var.ami_id
  subnet_id          = module.networking.subnet_id
  security_group_ids = [module.networking.security_group_id]
  key_name           = var.key_name
  tags               = local.tags
}

module "storage" {
  source = "./modules/storage"

  bucket_name = var.s3_bucket_name
  tags        = local.tags
}
