terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "~> 5.0"
      configuration_aliases = [azurerm.src, azurerm.dest]
    }
    azurecaf = {
      source  = "claranet/azurecaf"
      version = "~> 1.3.0"
    }
    azapi = {
      source  = "azure/azapi"
      version = "~> 2.3"
    }
  }
}
