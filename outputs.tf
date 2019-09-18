output "vnet_peering_src_id" {
  description = "Virtual network src peering id"
  value       = azurerm_virtual_network_peering.peering_src.id
}

output "vnet_peering_src_name" {
  description = "Virtual network src peering name"
  value       = azurerm_virtual_network_peering.peering_src.name
}

output "vnet_peering_dest_id" {
  description = "Virtual network dest peering id"
  value       = azurerm_virtual_network_peering.peering_dest.id
}

output "vnet_peering_dest_name" {
  description = "Virtual network dest peering name"
  value       = azurerm_virtual_network_peering.peering_dest.name
}
