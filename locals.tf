locals {
  src_parts               = provider::azapi::parse_resource_id("Microsoft.Network/virtualNetworks", var.src_virtual_network_id)
  src_name                = local.src_parts.name
  src_resource_group_name = local.src_parts.resource_group_name

  dest_parts               = provider::azapi::parse_resource_id("Microsoft.Network/virtualNetworks", var.dest_virtual_network_id)
  dest_name                = local.dest_parts.name
  dest_resource_group_name = local.dest_parts.resource_group_name
}
