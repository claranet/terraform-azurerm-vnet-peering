locals {
  vnet_src_parts               = split("/", var.vnet_src_id)
  vnet_src_name                = element(local.vnet_src_parts, 8)
  vnet_src_resource_group_name = element(local.vnet_src_parts, 4)

  vnet_dest_parts               = split("/", var.vnet_dest_id)
  vnet_dest_name                = element(local.vnet_dest_parts, 8)
  vnet_dest_resource_group_name = element(local.vnet_dest_parts, 4)

  # No more need to get Sub ID, provider is configured in the upper Terraform code
  # vnet_src_subscription_id     = element(local.vnet_src_parts, 2)
  # vnet_dest_subscription_id     = element(local.vnet_dest_parts, 2)
}
