terraform {
  required_version = ">= 1.3.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }
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