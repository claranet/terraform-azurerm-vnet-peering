
module "azure_virtual_network" {
  source  = "claranet/vnet/azurerm"
  version = "x.x.x"

  environment    = var.environment
  location       = module.azure_region.location
  location_short = module.azure_region.location_short
  client_name    = var.client_name
  stack          = var.stack

  resource_group_name = module.rg.name

  cidrs       = ["10.10.0.0/16"]
  dns_servers = ["10.0.0.4", "10.0.0.5"] # Can be empty if not used
}

module "azure_vnet_peering" {
  source  = "claranet/vnet-peering/azurerm"
  version = "x.x.x"

  providers = {
    azurerm.src  = azurerm
    azurerm.dest = azurerm.preprod
  }

  src_virtual_network_id  = module.azure_virtual_network.id
  dest_virtual_network_id = var.virtual_network_id_dest

  src_forwarded_traffic_allowed  = true
  dest_forwarded_traffic_allowed = true

  src_virtual_network_access_allowed  = true
  dest_virtual_network_access_allowed = true
}
