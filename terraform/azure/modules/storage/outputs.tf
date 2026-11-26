output "storage_account_id" {
  description = "ID of the Storage Account"
  value       = azurerm_storage_account.this.id
}

output "storage_account_name" {
  description = "Name of the Storage Account"
  value       = azurerm_storage_account.this.name
}

output "primary_web_endpoint" {
  description = "Static website primary endpoint URL"
  value       = azurerm_storage_account.this.primary_web_endpoint
}

output "primary_blob_endpoint" {
  description = "Primary blob service endpoint"
  value       = azurerm_storage_account.this.primary_blob_endpoint
}
