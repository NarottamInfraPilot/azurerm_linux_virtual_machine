locals {
  pip_name = "${var.name}-pip"
}

# Public IP (created only if public_ip is true)
resource "azurerm_public_ip" "this" {
  count = var.public_ip ? 1 : 0

  name                = local.pip_name
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Dynamic"
  sku                 = lookup(var.public_ip_config, "sku", "Basic")
  tags                = merge(var.tags, { "env" = var.environment, "created_by" = "terraform" })
}

# Network Interface
resource "azurerm_network_interface" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = merge(var.tags, { "env" = var.environment, "created_by" = "terraform" })

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip != null ? "Static" : "Dynamic"
    private_ip_address            = var.private_ip
    public_ip_address_id          = var.public_ip ? azurerm_public_ip.this[0].id : null
  }
}
