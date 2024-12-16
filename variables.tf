###############
#
# SRC PEER CONF
#
###############

variable "src_virtual_network_id" {
  description = "ID of the source Virtual Network to peer."
  type        = string
  nullable    = false
}

variable "src_virtual_network_access_allowed" {
  description = "Controls if the VMs in the remote virtual network can access VMs in the local virtual network. [See documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering.html#allow_virtual_network_access-1)."
  type        = bool
  default     = false
}

variable "src_forwarded_traffic_allowed" {
  description = "Controls if forwarded traffic from VMs in the remote virtual network is allowed. [See documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering.html#allow_forwarded_traffic-1)."
  type        = bool
  default     = false
}

variable "src_gateway_transit_allowed" {
  description = "Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network. [See documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering.html#allow_gateway_transit-1)."
  type        = bool
  default     = false
}

variable "use_src_remote_gateway" {
  description = "Controls if remote gateways can be used on the local virtual network. [See documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering.html#use_remote_gateways-1)."
  type        = bool
  default     = false
}

################
#
# DEST PEER CONF
#
################

variable "dest_virtual_network_id" {
  description = "ID of the destination Virtual Network to peer."
  type        = string
  nullable    = false
}

variable "dest_virtual_network_access_allowed" {
  description = "Controls if the VMs in the remote virtual network can access VMs in the local virtual network. [See documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering.html#allow_virtual_network_access-1)."
  type        = bool
  default     = false
}

variable "dest_forwarded_traffic_allowed" {
  description = "Controls if forwarded traffic from VMs in the remote virtual network is allowed. [See documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering.html#allow_forwarded_traffic-1)."
  type        = bool
  default     = false
}

variable "dest_gateway_transit_allowed" {
  description = "Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network. [See documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering.html#allow_gateway_transit-1)."
  type        = bool
  default     = false
}

variable "use_dest_remote_gateway" {
  description = "Controls if remote gateways can be used on the local virtual network. [See documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering.html#use_remote_gateways-1)."
  type        = bool
  default     = false
}
