output "vm_id" {
  description = "The ID of the Linux Virtual Machine"
  value       = azurerm_linux_virtual_machine.this.id
}

output "vm_name" {
  description = "The name of the Linux Virtual Machine"
  value       = azurerm_linux_virtual_machine.this.name
}

output "private_ip_address" {
  description = "The primary private IP address of the VM"
  value       = azurerm_linux_virtual_machine.this.private_ip_address
}

output "public_ip_address" {
  description = "The public IP address of the VM"
  value       = azurerm_linux_virtual_machine.this.public_ip_address
}

output "admin_username" {
  description = "The admin username of the VM"
  value       = azurerm_linux_virtual_machine.this.admin_username
}

# Note: We don't output the admin_password as it's sensitive
