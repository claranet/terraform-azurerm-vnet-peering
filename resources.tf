
resource "azurerm_virtual_network_peering" "main" {
  provider = azurerm.src

  name = coalesce(
    var.src_custom_name,
    data.azurecaf_name.src.result,
  )
  resource_group_name          = local.src_resource_group_name
  virtual_network_name         = local.src_name
  remote_virtual_network_id    = var.dest_virtual_network_id
  allow_virtual_network_access = var.src_virtual_network_access_allowed
  allow_forwarded_traffic      = var.src_forwarded_traffic_allowed
  allow_gateway_transit        = var.src_gateway_transit_allowed
  use_remote_gateways          = var.use_src_remote_gateway
}

moved {
  from = azurerm_virtual_network_peering.peering_src
  to   = azurerm_virtual_network_peering.main
}

resource "azurerm_virtual_network_peering" "dest" {
  provider = azurerm.dest

  name = coalesce(
    var.dst_custom_name,
    data.azurecaf_name.dst.result,
  )
  resource_group_name          = local.dest_resource_group_name
  virtual_network_name         = local.dest_name
  remote_virtual_network_id    = var.src_virtual_network_id
  allow_virtual_network_access = var.dest_virtual_network_access_allowed
  allow_forwarded_traffic      = var.dest_forwarded_traffic_allowed
  allow_gateway_transit        = var.dest_gateway_transit_allowed
  use_remote_gateways          = var.use_dest_remote_gateway
}

moved {
  from = azurerm_virtual_network_peering.peering_dest
  to   = azurerm_virtual_network_peering.dest
}
