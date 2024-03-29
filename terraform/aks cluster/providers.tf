terraform {
  required_version = ">=1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "62086a1d-1261-4c50-8a2d-734ed260fd8d"
  tenant_id       = "a9313beb-02e5-4337-ad1e-e101ac3ec7ca"
}