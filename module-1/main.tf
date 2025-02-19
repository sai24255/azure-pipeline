terraform {
  required_providers {
    azurerm={
        source = "hashicorp/azurerm"
        version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "example3" {
  name     = "my-rg" # Ensure this matches the existing resource group name
  location = "eastus" # Ensure this matches the existing resource group location
}

resource "azurerm_storage_account" "deepslabteststorageacc" {
  name = "deepslabteststorageacc"
  resource_group_name = "my-rg"
  location = "eastus"
  account_tier = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "deepslabserviceplan" {
  name = "deepslabserviceplan"
  resource_group_name = "my-rg"
  location = "eastus"
  os_type = "Linux"
  sku_name = "Y1"
}

resource "azurerm_linux_function_app" "deepslabtestfunctionapp" {
  name = "deepslabtestfunctionapp"
  resource_group_name = "my-rg"
  location = "eastus"
  storage_account_name = azurerm_storage_account.deepslabteststorageacc.name
  storage_account_access_key = azurerm_storage_account.deepslabteststorageacc.primary_access_key
  service_plan_id = azurerm_service_plan.deepslabserviceplan.id
  depends_on = [ azurerm_service_plan.deepslabserviceplan , azurerm_storage_account.deepslabteststorageacc ]
  site_config {}
}