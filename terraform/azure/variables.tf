variable "location" {
  description = "Azure region for all resources"
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
  default     = "resourcegroupclaudecode"
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
  description = "Source IP/CIDR allowed for SSH and RDP. Replace 0.0.0.0/32 with your real IP before applying."
  type        = string
  default     = "0.0.0.0/32"
}

variable "vm_admin_username" {
  description = "Administrator username for the Linux VM"
  type        = string
  sensitive   = true
}

variable "vm_admin_password" {
  description = "Administrator password for the Linux VM (min 12 chars, mixed case + digit + special)"
  type        = string
  sensitive   = true
}

variable "storage_account_name" {
  description = "Globally unique name for the Azure Storage Account (3-24 lowercase alphanumeric)"
  type        = string
  default     = "saclaudecode1987"
}
