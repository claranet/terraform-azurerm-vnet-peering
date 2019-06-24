locals {
  vnet_src_parts               = "${split("/", var.vnet_src_id)}"
  vnet_src_name                = "${element(local.vnet_src_parts, 8)}"
  vnet_src_subscription_id     = "${element(local.vnet_src_parts, 2)}"
  vnet_src_resource_group_name = "${element(local.vnet_src_parts, 4)}"

  vnet_dest_parts               = "${split("/", var.vnet_dest_id)}"
  vnet_dest_name                = "${element(local.vnet_dest_parts, 8)}"
  vnet_dest_subscription_id     = "${element(local.vnet_dest_parts, 2)}"
  vnet_dest_resource_group_name = "${element(local.vnet_dest_parts, 4)}"
}

data "azurerm_client_config" "current_config" {}

provider "azurerm" {
  version         = ">= 1.20.0"
  subscription_id = "${local.vnet_src_subscription_id}"
  tenant_id       = "${coalesce(var.vnet_src_tenant_id, data.azurerm_client_config.current_config.tenant_id)}"
  alias           = "src"
}

provider "azurerm" {
  version         = ">= 1.20.0"
  subscription_id = "${local.vnet_dest_subscription_id}"
  tenant_id       = "${coalesce(var.vnet_dest_tenant_id, data.azurerm_client_config.current_config.tenant_id)}"
  alias           = "dest"
}
