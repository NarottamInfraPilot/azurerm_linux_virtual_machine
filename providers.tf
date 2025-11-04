provider "azurerm" {
  features {}

  # Use environment variables for authentication:
  # ARM_CLIENT_ID
  # ARM_CLIENT_SECRET
  # ARM_SUBSCRIPTION_ID
  # ARM_TENANT_ID

  # Alternatively, use az login and set subscription:
  subscription_id = var.subscription_id
}

variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string
  sensitive   = true
}
