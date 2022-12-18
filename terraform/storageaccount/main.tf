resource "random_pet" "rg_name" {
  prefix = var.resource_group_name_prefix
}

resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = random_pet.rg_name.id
}

resource "azurerm_storage_account" "lsttfstate" {
  name                     = "lsttfstate${azurerm_resource_group.rg.name}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  # allow_blob_public_access = "true"
}

resource "azurerm_storage_container" "lsttfstatecontainer" {
  name                  = "lsttfstatecontainer"
  storage_account_name  = azurerm_storage_account.lsttfstate.name
  container_access_type = "blob"
}