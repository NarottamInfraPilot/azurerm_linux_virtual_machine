locals {
  environment = "prod"
  location    = "eastus2" # Primary region
  dr_location = "westus2" # DR region (for future use)

  common_tags = merge(var.tags, {
    "environment" = local.environment
    "created_by"  = "terraform"
    "project"     = "azure-vm-demo"
    "criticality" = "high"
  })
}

# Resource Group
module "resource_group" {
  source = "../../modules/azurerm_resource_group"

  resource_group_name = "${local.environment}-rg"
  location            = local.location
  tags                = local.common_tags
  prevent_destroy     = true # Always prevent destroy in production
}

# Virtual Network
module "virtual_network" {
  source = "../../modules/azurerm_virtual_network"

  vnet_name           = "${local.environment}-vnet"
  address_space       = ["10.2.0.0/16"] # Production CIDR
  location            = module.resource_group.resource_group_location
  resource_group_name = module.resource_group.resource_group_name
  dns_servers         = [] # Add custom DNS servers if needed
  environment         = local.environment
  tags                = local.common_tags
}

# Subnets
module "subnets" {
  source = "../../modules/azurerm_subnet"

  resource_group_name  = module.resource_group.resource_group_name
  virtual_network_name = module.virtual_network.vnet_name
  location             = local.location
  environment          = local.environment
  tags                 = local.common_tags
  subnets              = var.subnets
}

# Network Interfaces and VMs
module "network_interfaces" {
  source   = "../../modules/azurerm_network_interface"
  for_each = var.vms

  name                = "${local.environment}-${each.key}-nic"
  location            = local.location
  resource_group_name = module.resource_group.resource_group_name
  subnet_id           = module.subnets.subnet_ids[each.value.subnet_name]
  private_ip          = each.value.private_ip
  public_ip           = each.value.public_ip
  environment         = local.environment
  tags                = local.common_tags
}

module "linux_vms" {
  source   = "../../modules/azurerm_linux_virtual_machine"
  for_each = var.vms

  vm_name              = "${local.environment}-${each.key}"
  location             = local.location
  resource_group_name  = module.resource_group.resource_group_name
  network_interface_id = module.network_interfaces[each.key].nic_id

  vm_size        = each.value.vm_size
  admin_username = each.value.admin_username
  admin_password = each.value.admin_password
  enable_backup  = true # Always enable backup in production

  environment = local.environment
  tags        = local.common_tags

  depends_on = [module.network_interfaces]
}
