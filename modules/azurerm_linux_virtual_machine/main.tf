locals {
  os_disk_name = "${var.vm_name}-osdisk"
}

# Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "this" {
  name                            = var.vm_name
  location                        = var.location
  resource_group_name             = var.resource_group_name
  network_interface_ids           = [var.network_interface_id]
  size                            = coalesce(var.vm_size, var.default_vm_size)
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = false # Enable password authentication
  tags                            = merge(var.tags, { "env" = var.environment, "created_by" = "terraform" })

  os_disk {
    name                 = local.os_disk_name
    caching              = lookup(var.os_disk_config, "caching", "ReadWrite")
    storage_account_type = lookup(var.os_disk_config, "storage_account_type", "Standard_LRS")
    disk_size_gb         = lookup(var.os_disk_config, "disk_size_gb", 30)
  }

  source_image_reference {
    publisher = lookup(var.source_image_reference, "publisher", "Canonical")
    offer     = lookup(var.source_image_reference, "offer", "0001-com-ubuntu-server-focal")
    sku       = lookup(var.source_image_reference, "sku", "20_04-lts")
    version   = lookup(var.source_image_reference, "version", "latest")
  }

  # Optional VM backup
  dynamic "backup" {
    for_each = var.enable_backup ? ["enabled"] : []
    content {
      backup_policy_id = var.backup_policy_id
    }
  }

  lifecycle {
    prevent_destroy = var.prevent_destroy
  }
}
