terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = ">= 2.0.0"
      configuration_aliases = [azurerm.src, azurerm.dst]
    }
  }
}

provider "azurerm" {
  features {}
}
