resource "azurerm_virtual_network_peering" "peering" {
  count = 2

  name                         = "${coalesce(element(var.custom_peering_names, count.index), format("peering-to-%s", element(var.vnet_names, 1 - count.index)))}"
  resource_group_name          = "${element(var.vnet_rgs_names, count.index)}"
  virtual_network_name         = "${element(var.vnet_names, count.index)}"
  remote_virtual_network_id    = "${element(var.vnet_ids, 1 - count.index)}"
  allow_virtual_network_access = "${element(var.allow_virtual_network_access, count.index)}"
  allow_forwarded_traffic      = "${element(var.allow_forwarded_traffic, count.index)}"
  allow_gateway_transit        = "${element(var.allow_gateway_transit, count.index)}"
  use_remote_gateways          = "${element(var.use_remote_gateways, count.index)}"
}
