data "azurecaf_name" "src" {
  name          = local.src_name
  resource_type = "azurerm_virtual_network_peering"
  prefixes      = var.name_prefix == "" ? null : [local.name_prefix]
  suffixes      = compact([local.name_suffix, local.dest_name])
  clean_input   = true
  separator     = "-"
}

moved {
  from = data.azurecaf_name.vnet_peering_src
  to   = data.azurecaf_name.src
}

data "azurecaf_name" "dst" {
  name          = local.dest_name
  resource_type = "azurerm_virtual_network_peering"
  prefixes      = var.name_prefix == "" ? null : [local.name_prefix]
  suffixes      = compact([local.name_suffix, local.src_name])
  clean_input   = true
  separator     = "-"
}

moved {
  from = data.azurecaf_name.vnet_peering_dst
  to   = data.azurecaf_name.dst
}
