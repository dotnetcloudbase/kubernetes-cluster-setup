terraform {
  backend "azurerm" {
    resource_group_name  = "DevSub02_Storage_RG"
    storage_account_name = "bjdterraform001"
    container_name       = "plans"
  }
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "k8s" {
  name                  = var.resource_group_name
  location              = var.location
}