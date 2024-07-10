terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }
}
provider "azurerm" {
    features {}
    skip_provider_registration = true
}

locals {
  tags = {
    "Environment" = var.environment
  }
}
resource "azurerm_storage_account" "storage" {
  name = var.storage_account_name
  resource_group_name = var.resource_group_name
  account_tier = "Standard"
  account_replication_type = var.environment == "Production" ? "GRS" : "LRS"
  location = var.location
  public_network_access_enabled = false

   tags = local.tags
}