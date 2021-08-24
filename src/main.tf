<<<<<<< HEAD
=======
provider "azurerm" {
  version = "~> 2.73.0"
  features  {}
}

provider "azurerm" {
  alias           = "acr"
  version         = "~> 2.73.0"
  features        {}
  subscription_id = var.acr_subscription
}

>>>>>>> 720cc2714ceaa5890be94fccc33e997c5acc6442
terraform {
  backend "azurerm" {
    storage_account_name = "bjdterraform001"
    container_name       = "plans"
  }
}

data "azurerm_virtual_network" "vnet" {
  name                = var.k8s_vnet
  resource_group_name = var.k8s_vnet_resource_group_name
}

data "azurerm_subnet" "k8s_subnet" {
  name                 = var.k8s_subnet
  virtual_network_name = var.k8s_vnet
  resource_group_name  = var.k8s_vnet_resource_group_name
}

data "azurerm_subnet" "management_subnet" {
  name                 = "Servers"
  virtual_network_name = var.k8s_vnet
  resource_group_name  = var.k8s_vnet_resource_group_name
}

data "azurerm_subnet" "private_endpoint_subnet" {
  name                 = "private-endpoints"
  virtual_network_name = var.k8s_vnet
  resource_group_name  = var.k8s_vnet_resource_group_name
}

resource "azurerm_resource_group" "k8s" {
  name                  = var.resource_group_name
  location              = var.location
}
