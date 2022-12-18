terraform {
  required_version = ">=0.12"

  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~>2.0"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.8"
    }

    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-safe-sawfly"
    storage_account_name = "lsttfstate8ub8l"
    container_name       = "lsttfstatecontainer"
    key                  = "terraform.lsttfstate"
  }
}

/* provider "azurerm" {
  features {}
  subscription_id = "556a8191-80bf-4752-b4de-c25ad263abf2"
  client_id       = "d6adfb30-53e3-4719-aba8-7ebff0416131"
  client_secret   = "dPM8Q~GUdkvISvfUvsWQ9BsJemSGgRe6r.CSFbin"
  tenant_id       = "a9313beb-02e5-4337-ad1e-e101ac3ec7ca"
} */

provider "azuread" {
  use_msi         = true
  tenant_id       = "a9313beb-02e5-4337-ad1e-e101ac3ec7ca"
  subscription_id = "556a8191-80bf-4752-b4de-c25ad263abf2"
}

provider "azurerm" {
  features {}
  use_msi         = true
  tenant_id       = "a9313beb-02e5-4337-ad1e-e101ac3ec7ca"
  subscription_id = "556a8191-80bf-4752-b4de-c25ad263abf2"
}
