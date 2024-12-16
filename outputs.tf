output "id" {
  description = "Source Virtual network peering id."
  value       = azurerm_virtual_network_peering.main.id
}

output "name" {
  description = "Source Virtual network peering name."
  value       = azurerm_virtual_network_peering.main.name
}

output "dest_id" {
  description = "Destination Virtual network peering id."
  value       = azurerm_virtual_network_peering.dest.id
}

output "dest_name" {
  description = "Destination Virtual network peering name."
  value       = azurerm_virtual_network_peering.dest.name
}

output "resource" {
  description = "Virtual network peering resource object."
  value       = azurerm_virtual_network_peering.main
}

output "resource_dest" {
  description = "Destination Virtual network peering resource object."
  value       = azurerm_virtual_network_peering.dest
}
