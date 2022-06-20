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

module "azure_region" {
  source  = "claranet/regions/azurerm"
  version = "x.x.x"

  azure_region = var.azure_region
}

module "rg" {
  source  = "claranet/rg/azurerm"
  version = "x.x.x"

  location    = module.azure_region.location
  client_name = var.client_name
  environment = var.environment
  stack       = var.stack
}

module "azure_virtual_network" {
  source  = "claranet/vnet/azurerm"
  version = "x.x.x"

  environment    = var.environment
  location       = module.azure_region.location
  location_short = module.azure_region.location_short
  client_name    = var.client_name
  stack          = var.stack

  resource_group_name = module.rg.resource_group_name

  vnet_cidr   = ["10.10.0.0/16"]
  dns_servers = ["10.0.0.4", "10.0.0.5"] # Can be empty if not used
}

module "azure_vnet_peering" {
  source  = "claranet/vnet-peering/azurerm"
  version = "x.x.x"

  providers = {
    azurerm.src = azurerm
    azurerm.dst = azurerm.preprod
  }

  vnet_src_id  = module.azure_virtual_network.virtual_network_id
  vnet_dest_id = var.virtual_network_id_dest

  allow_forwarded_src_traffic  = true
  allow_forwarded_dest_traffic = true

  allow_virtual_src_network_access  = true
  allow_virtual_dest_network_access = true
}
