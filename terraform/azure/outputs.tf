output "resource_group_id" {
  description = "ID of the Resource Group"
  value       = azurerm_resource_group.this.id
}

output "resource_group_name" {
  description = "Name of the Resource Group"
  value       = azurerm_resource_group.this.name
}

output "vnet_id" {
  description = "ID of the Virtual Network"
  value       = module.networking.vnet_id
}

output "subnet_id" {
  description = "ID of the Subnet"
  value       = module.networking.subnet_id
}

output "vm_public_ip" {
  description = "Public IP address of the Linux VM"
  value       = module.compute.public_ip_address
}

output "vm_private_ip" {
  description = "Private IP address of the Linux VM"
  value       = module.compute.private_ip_address
}

output "static_website_url" {
  description = "Static website primary endpoint"
  value       = module.storage.primary_web_endpoint
}

output "storage_account_name" {
  description = "Name of the Storage Account"
  value       = module.storage.storage_account_name
}
