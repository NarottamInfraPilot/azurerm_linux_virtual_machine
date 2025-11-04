# Example dev environment configuration
tags = {
  "owner"       = "platform-team"
  "environment" = "dev"
  "cost-center" = "dev-001"
}

subnets = {
  web = {
    address_prefix = "10.0.1.0/24"
    service        = "web"
    enable_nsg     = true
  }
  app = {
    address_prefix = "10.0.2.0/24"
    service        = "app"
    enable_nsg     = true
  }
}

vms = {
  web-01 = {
    vm_size        = "Standard_B1s"
    subnet_name    = "web"
    public_ip      = true
    admin_username = "azureuser"
    # DO NOT store passwords in version control
    # Use environment variables, Azure Key Vault, or other secure methods
    admin_password = "REPLACE_WITH_SECURE_PASSWORD"
  }
  app-01 = {
    vm_size        = "Standard_B1ms"
    subnet_name    = "app"
    private_ip     = "10.0.2.10"
    public_ip      = false
    admin_username = "azureuser"
    admin_password = "REPLACE_WITH_SECURE_PASSWORD"
    enable_backup  = true
  }
}
