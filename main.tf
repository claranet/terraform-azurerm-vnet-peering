data "azurerm_client_config" "current_config" {
}

provider "azurerm" {
  version         = ">= 1.31.0"
  subscription_id = local.vnet_src_subscription_id
  tenant_id = coalesce(
    var.vnet_src_tenant_id,
    data.azurerm_client_config.current_config.tenant_id,
  )
  alias = "src"
}

provider "azurerm" {
  version         = ">= 1.31.0"
  subscription_id = local.vnet_dest_subscription_id
  tenant_id = coalesce(
    var.vnet_dest_tenant_id,
    data.azurerm_client_config.current_config.tenant_id,
  )
  alias = "dest"
}
