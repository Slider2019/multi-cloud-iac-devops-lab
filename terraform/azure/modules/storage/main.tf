resource "azurerm_storage_account" "this" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  static_website {
    index_document     = var.static_website_index_document
    error_404_document = var.static_website_error_404_document
  }

  tags = var.tags
}
