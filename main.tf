provider "azurerm" {
  version                    = ">= 2.0"
  subscription_id            = local.vnet_src_subscription_id
  tenant_id                  = var.vnet_src_tenant_id
  client_id                  = var.vnet_src_client_id
  client_secret              = var.vnet_src_client_secret
  skip_provider_registration = var.skip_src_provider_registration
  features {}
}

provider "azurerm" {
  version                    = ">= 2.0"
  subscription_id            = local.vnet_dest_subscription_id
  tenant_id                  = var.vnet_dest_tenant_id
  client_id                  = var.vnet_dest_client_id
  client_secret              = var.vnet_dest_client_secret
  alias                      = "dest"
  skip_provider_registration = var.skip_dest_provider_registration
  features {}
}
