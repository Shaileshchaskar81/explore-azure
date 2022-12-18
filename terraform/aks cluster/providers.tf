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
  client_id       = "d6adfb30-53e3-4719-aba8-7ebff0416131"
  client_secret   = "dPM8Q~GUdkvISvfUvsWQ9BsJemSGgRe6r.CSFbin"
  tenant_id       = "a9313beb-02e5-4337-ad1e-e101ac3ec7ca"
}