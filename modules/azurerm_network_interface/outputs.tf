output "nic_id" {
  description = "ID of the created network interface"
  value       = azurerm_network_interface.this.id
}

output "private_ip_address" {
  description = "Private IP address of the created network interface"
  value       = azurerm_network_interface.this.private_ip_address
}

output "public_ip_address" {
  description = "Public IP address if created"
  value       = var.public_ip ? azurerm_public_ip.this[0].ip_address : null
}
