resource "azurerm_virtual_network" "this" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_servers         = var.dns_servers
  tags                = merge(var.tags, { "env" = var.environment, "created_by" = "terraform" })

  lifecycle {
    prevent_destroy = var.prevent_destroy
  }
}
