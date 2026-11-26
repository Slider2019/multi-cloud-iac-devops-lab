variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "storage_account_name" {
  description = "Name of the Storage Account (globally unique, 3-24 lowercase alphanumeric)"
  type        = string
  default     = "saclaudecode1987"
}

variable "account_tier" {
  description = "Storage account tier"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Storage account replication type"
  type        = string
  default     = "LRS"
}

variable "static_website_index_document" {
  description = "Index document for the static website"
  type        = string
  default     = "index.html"
}

variable "static_website_error_404_document" {
  description = "Error 404 document for the static website"
  type        = string
  default     = "404.html"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}
