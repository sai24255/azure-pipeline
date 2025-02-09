provider "azurerm" {
  features {}
  subscription_id = "362c226d-ca9d-48db-bbec-9ab0d6c3e55a"
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "East US"
}