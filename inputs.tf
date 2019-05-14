variable "vnet_ids" {
  description = "Ids of the 2 vnets to peer"
  type        = "list"
}

variable "vnet_names" {
  description = "Names of the 2 vnets to peer"
  type        = "list"
}

variable "vnet_rgs_names" {
  description = "Resource group names of the 2 vnets to peer"
  type        = "list"
}

variable "allow_virtual_network_access" {
  description = "Option allow_virtual_network_access for the 2 vnets to peer. Controls if the VMs in the remote virtual network can access VMs in the local virtual network. Defaults to false. https://www.terraform.io/docs/providers/azurerm/r/virtual_network_peering.html#allow_virtual_network_access"
  type        = "list"
  default     = [false, false]
}

variable "allow_forwarded_traffic" {
  description = "Option allow_forwarded_traffic for the 2 vnets to peer. Controls if forwarded traffic from VMs in the remote virtual network is allowed. Defaults to false. https://www.terraform.io/docs/providers/azurerm/r/virtual_network_peering.html#allow_forwarded_traffic"
  type        = "list"
  default     = [false, false]
}

variable "allow_gateway_transit" {
  description = "Option allow_gateway_transit for the 2 vnets to peer. Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network. https://www.terraform.io/docs/providers/azurerm/r/virtual_network_peering.html#allow_gateway_transit"
  type        = "list"
  default     = [false, false]
}

variable "use_remote_gateways" {
  description = "Option use_remote_gateways for the 2 vnets to peer. Controls if remote gateways can be used on the local virtual network. https://www.terraform.io/docs/providers/azurerm/r/virtual_network_peering.html#use_remote_gateways"
  type        = "list"
  default     = [false, false]
}

variable "custom_peering_names" {
  description = "Custom names of the vnet peerings to create"
  type        = "list"
  default     = [""]
}
