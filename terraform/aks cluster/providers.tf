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
  subscription_id = "556a8191-80bf-4752-b4de-c25ad263abf2"
  tenant_id       = "a9313beb-02e5-4337-ad1e-e101ac3ec7ca"
}