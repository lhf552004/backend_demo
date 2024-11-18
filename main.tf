provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "backend" {
  name     = "terraform-backend-rg"
  location = "eastus"
}

resource "azurerm_storage_account" "backend" {
  name                     = "nlchiterraformstate123"
  resource_group_name      = azurerm_resource_group.backend.name
  location                 = azurerm_resource_group.backend.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "backend" {
  name                  = "tfstate"
  storage_account_id    = azurerm_storage_account.backend.id
  container_access_type = "private"
}
