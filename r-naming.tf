data "azurecaf_name" "vnet_peering_src" {
  name          = local.vnet_src_name
  resource_type = "azurerm_virtual_network_peering"
  prefixes      = var.name_prefix == "" ? null : [local.name_prefix]
  suffixes      = compact([local.name_suffix, local.vnet_dest_name])
  clean_input   = true
  separator     = "-"
}

data "azurecaf_name" "vnet_peering_dst" {
  name          = local.vnet_dest_name
  resource_type = "azurerm_virtual_network_peering"
  prefixes      = var.name_prefix == "" ? null : [local.name_prefix]
  suffixes      = compact([local.name_suffix, local.vnet_src_name])
  clean_input   = true
  separator     = "-"
}
