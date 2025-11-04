variable "tags" {
  description = "A map of tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "subnets" {
  description = "Map of subnet configurations"
  type = map(object({
    address_prefix = string
    service        = string
    enable_nsg     = bool
    nat_gateway_id = optional(string)
  }))
}

variable "vms" {
  description = "Map of VM configurations"
  type = map(object({
    vm_size         = optional(string)
    subnet_name     = string
    private_ip      = optional(string)
    public_ip       = optional(bool)
    admin_username  = string
    admin_password  = string
    enable_backup   = optional(bool)
  }))
}