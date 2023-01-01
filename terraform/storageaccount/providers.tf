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
}

/*provider "azurerm" {
  features {}
   subscription_id = "556a8191-80bf-4752-b4de-c25ad263abf2"
  tenant_id       = "a9313beb-02e5-4337-ad1e-e101ac3ec7ca" 
}
*/

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


