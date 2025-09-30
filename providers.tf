terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "~> 4.31"
      configuration_aliases = [azurerm.src, azurerm.dest]
    }
    azurecaf = {
      source  = "claranet/azurecaf"
      version = ">= 1.2.28"
    }
    azapi = {
      source  = "azure/azapi"
      version = "~> 2.3"
    }
  }
}
