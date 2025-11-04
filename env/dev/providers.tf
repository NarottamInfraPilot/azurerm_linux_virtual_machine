terraform {
  required_version = ">= 1.2.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}

  # Prefer environment variables for authentication (recommended):
  # ARM_CLIENT_ID, ARM_CLIENT_SECRET, ARM_TENANT_ID, ARM_SUBSCRIPTION_ID
  # You can also pass subscription via var.subscription_id in this folder.
  subscription_id = var.subscription_id != "" ? var.subscription_id : null
}

variable "subscription_id" {
  description = "Optional subscription id. Prefer ARM_SUBSCRIPTION_ID env var instead."
  type        = string
  default     = ""
  sensitive   = true
}
