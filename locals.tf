locals {
  parsed_src              = provider::azapi::parse_resource_id("Microsoft.Network/virtualNetworks", var.src_virtual_network_id)
  src_name                = local.parsed_src.name
  src_resource_group_name = local.parsed_src.resource_group_name

  parsed_dest              = provider::azapi::parse_resource_id("Microsoft.Network/virtualNetworks", var.dest_virtual_network_id)
  dest_name                = local.parsed_dest.name
  dest_resource_group_name = local.parsed_dest.resource_group_name
}
