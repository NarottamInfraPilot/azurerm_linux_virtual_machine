variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "location" {
  description = "Azure region where the VM will be created"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "network_interface_id" {
  description = "ID of the network interface to attach to the VM"
  type        = string
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default     = null # Will use default_vm_size if not specified
}

variable "default_vm_size" {
  description = "Default VM size if not specified in vm_size"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Username for the VM admin account"
  type        = string
}

variable "admin_password" {
  description = "Password for the VM admin account"
  type        = string
  sensitive   = true
}

variable "os_disk_config" {
  description = "Configuration for the OS disk"
  type = object({
    caching              = optional(string)
    storage_account_type = optional(string)
    disk_size_gb         = optional(number)
  })
  default = {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = 30
  }
}

variable "source_image_reference" {
  description = "Source image reference for the VM"
  type = object({
    publisher = optional(string)
    offer     = optional(string)
    sku       = optional(string)
    version   = optional(string)
  })
  default = {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}

variable "enable_backup" {
  description = "Whether to enable VM backup"
  type        = bool
  default     = false
}

variable "backup_policy_id" {
  description = "ID of the backup policy to use if backup is enabled"
  type        = string
  default     = null
}

variable "prevent_destroy" {
  description = "Whether to prevent the VM from being destroyed"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply to the VM"
  type        = map(string)
  default     = {}
}

variable "environment" {
  description = "Environment name for tagging"
  type        = string
}
