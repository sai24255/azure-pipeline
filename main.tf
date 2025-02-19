provider "azurerm" {
  features {}
  subscription_id = "362c226d-ca9d-48db-bbec-9ab0d6c3e55a"
}

resource "azurerm_resource_group" "examples" {
  name     = "example-resources1"
  location = "East US"
}
resource "azurerm_resource_group" "exapmle2" {
  name     = "sai"
  location = "East US"
}
resource "azurerm_resource_group" "example3" {
  name = "my-rg"
  location = "East US"
}
module "app" {
  source = "./module-1/"
}