provider "azurerm" {
  subscription_id = var.azure_subscription_id
  tenant_id       = var.azure_tenant_id

  features {}
}

provider "azurerm" {
  alias           = "preprod"
  subscription_id = var.preprod_subscription_id
  tenant_id       = var.azure_tenant_id

  features {}
}

terraform {
  required_version = ">= 1.3"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}
