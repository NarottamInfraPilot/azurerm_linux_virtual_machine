variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "address_space" {
  description = "The address space that is used by the virtual network"
  type        = list(string)
}

variable "location" {
  description = "The location/region where the virtual network is created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual network"
  type        = string
}

variable "dns_servers" {
  description = "List of DNS servers to use for the virtual network"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "environment" {
  description = "The environment this virtual network belongs to"
  type        = string
}

variable "prevent_destroy" {
  description = "Whether to prevent destruction of the virtual network"
  type        = bool
  default     = false
}
