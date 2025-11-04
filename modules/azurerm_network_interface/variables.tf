variable "name" {
  description = "Name of the network interface"
  type        = string
}

variable "location" {
  description = "Azure region where the network interface will be created"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet where the interface will be created"
  type        = string
}

variable "private_ip" {
  description = "Private IP address (optional, dynamic if not provided)"
  type        = string
  default     = null
}

variable "public_ip" {
  description = "Whether to create a public IP for this interface"
  type        = bool
  default     = false
}

variable "public_ip_config" {
  description = "Configuration for public IP if enabled"
  type = object({
    sku = optional(string)
  })
  default = {
    sku = "Basic"
  }
}

variable "tags" {
  description = "Tags to apply to the network interface"
  type        = map(string)
  default     = {}
}

variable "environment" {
  description = "Environment name for tagging"
  type        = string
}
