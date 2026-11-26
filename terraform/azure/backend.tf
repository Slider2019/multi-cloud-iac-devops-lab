terraform {
  backend "azurerm" {
    # These values must be provided via -backend-config flags or environment variables.
    # Example:
    #   terraform init \
    #     -backend-config="resource_group_name=rg-tfstate" \
    #     -backend-config="storage_account_name=satfstate<unique>" \
    #     -backend-config="container_name=tfstate" \
    #     -backend-config="key=azure/terraform.tfstate"
    resource_group_name  = "rg-tfstate"
    storage_account_name = "satfstateclaudecode"
    container_name       = "tfstate"
    key                  = "azure/terraform.tfstate"
  }
}
