output "vnet_peering_ids" {
  description = "Virtual network peering ids"
  value       = "${azurerm_virtual_network_peering.peering.*.id}"
}

output "vnet_peering_names" {
  description = "Virtual network peering names"
  value       = "${azurerm_virtual_network_peering.peering.*.name}"
}
