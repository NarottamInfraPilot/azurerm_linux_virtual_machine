output "subnet_ids" {
  description = "Map of subnet names to their IDs"
  value       = { for k, v in azurerm_subnet.this : k => v.id }
}

output "subnet_address_prefixes" {
  description = "Map of subnet names to their address prefixes"
  value       = { for k, v in azurerm_subnet.this : k => v.address_prefixes[0] }
}

output "nsg_ids" {
  description = "Map of NSG names to their IDs"
  value       = { for k, v in azurerm_network_security_group.this : k => v.id }
}
