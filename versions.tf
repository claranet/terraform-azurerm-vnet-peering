terraform {
  required_version = ">= 0.15"
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = ">= 2.0"
      configuration_aliases = [azurerm.src, azurerm.dst]
    }
    azurecaf = {
      source  = "aztfmod/azurecaf"
      version = "~> 1.2, >= 1.2.22"
    }
  }
}
