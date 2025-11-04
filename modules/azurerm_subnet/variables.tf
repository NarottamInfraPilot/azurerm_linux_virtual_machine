variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
}

variable "environment" {
  description = "The environment (dev, uat, prod)"
  type        = string
}

variable "tags" {
  description = "A map of tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "subnets" {
  description = "Map of subnet configurations"
  type = map(object({
    address_prefix    = string
    service           = string
    enable_nsg        = bool
    nat_gateway_id    = optional(string)
    service_endpoints = optional(list(string))
  }))
}

# Example of the expected subnets input:
# subnets = {
#   web = {
#     address_prefix = "10.0.1.0/24"
#     service        = "web"
#     enable_nsg     = true
#   }
#   app = {
#     address_prefix = "10.0.2.0/24"
#     service        = "app"
#     enable_nsg     = true
#   }
#   db = {
#     address_prefix = "10.0.3.0/24"
#     service        = "db"
#     enable_nsg     = false
#     service_endpoints = ["Microsoft.Sql"]
#   }
# }
