provider "aviatrix" {
  controller_ip = var.controller_ip
  username      = var.username
  password      = var.password
  version       = "2.17.1"
}

provider "azurerm" {
  version = "=2.30.0"
  features {}
  subscription_id = var.azure_subscription_id
  client_id       = var.azure_client_id
  client_secret   = var.azure_client_secret
  tenant_id       = var.azure_tenant_id
}