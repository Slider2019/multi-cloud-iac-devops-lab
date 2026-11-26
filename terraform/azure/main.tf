locals {
  tags = {
    Environment = var.environment
    Project     = var.project
    Owner       = var.owner
    ManagedBy   = "Terraform"
  }
}

resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location
  tags     = local.tags
}

module "networking" {
  source = "./modules/networking"

  resource_group_name   = azurerm_resource_group.this.name
  location              = azurerm_resource_group.this.location
  vnet_name             = "vnetclaudecode"
  subnet_name           = "snetclaudecode"
  nsg_name              = "nsgclaudecode"
  allowed_ip            = var.allowed_ip
  tags                  = local.tags
}

module "compute" {
  source = "./modules/compute"

  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  vm_name             = "vmclaudecode"
  subnet_id           = module.networking.subnet_id
  admin_username      = var.vm_admin_username
  admin_password      = var.vm_admin_password
  tags                = local.tags
}

module "storage" {
  source = "./modules/storage"

  resource_group_name  = azurerm_resource_group.this.name
  location             = azurerm_resource_group.this.location
  storage_account_name = var.storage_account_name
  tags                 = local.tags
}
