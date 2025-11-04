# Local variables for subnet naming
locals {
  subnet_names = keys(var.subnets)
}

resource "azurerm_subnet" "this" {
  for_each = var.subnets

  name                 = "${each.value.service}-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = [each.value.address_prefix]

  # Dynamic service endpoints block (if needed)
  dynamic "service_endpoints" {
    for_each = lookup(each.value, "service_endpoints", [])
    content {
      service = service_endpoints.value
    }
  }

  # Optional NAT Gateway association
  dynamic "nat_gateway" {
    for_each = lookup(each.value, "nat_gateway_id", null) != null ? [1] : []
    content {
      id = each.value.nat_gateway_id
    }
  }
}

# Create NSG for subnets that have enable_nsg = true
resource "azurerm_network_security_group" "this" {
  for_each = {
    for k, v in var.subnets : k => v
    if v.enable_nsg
  }

  name                = "${each.value.service}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = merge(var.tags, { "env" = var.environment, "created_by" = "terraform" })
}

# Associate NSG with subnet
resource "azurerm_subnet_network_security_group_association" "this" {
  for_each = {
    for k, v in var.subnets : k => v
    if v.enable_nsg
  }

  subnet_id                 = azurerm_subnet.this[each.key].id
  network_security_group_id = azurerm_network_security_group.this[each.key].id
}
