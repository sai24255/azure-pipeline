terraform {
  backend "azurerm" {
    resource_group_name   = "first-rg"
    storage_account_name  = "statemangement"  # Replace with your storage account name
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}
