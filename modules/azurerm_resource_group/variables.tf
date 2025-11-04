variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
}

variable "tags" {
  description = "A map of tags to apply to the resource group"
  type        = map(string)
  default     = {}
}

variable "prevent_destroy" {
  description = "Whether to prevent destruction of the resource group"
  type        = bool
  default     = false
}
