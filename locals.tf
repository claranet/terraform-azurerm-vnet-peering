locals {
  src_parts               = split("/", var.src_virtual_network_id)
  src_name                = element(local.src_parts, 8)
  src_resource_group_name = element(local.src_parts, 4)

  dest_parts               = split("/", var.dest_virtual_network_id)
  dest_name                = element(local.dest_parts, 8)
  dest_resource_group_name = element(local.dest_parts, 4)

}
