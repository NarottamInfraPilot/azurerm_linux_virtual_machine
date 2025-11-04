# Production environment configuration
tags = {
  "owner"       = "platform-team"
  "environment" = "prod"
  "cost-center" = "prod-001"
  "criticality" = "high"
}

subnets = {
  web = {
    address_prefix = "10.2.1.0/24"
    service        = "web"
    enable_nsg     = true
  }
  app = {
    address_prefix = "10.2.2.0/24"
    service        = "app"
    enable_nsg     = true
  }
  db = {
    address_prefix = "10.2.3.0/24"
    service        = "db"
    enable_nsg     = true
  }
}

vms = {
  web-01 = {
    vm_size        = "Standard_D2s_v3" # Production-grade VM sizes
    subnet_name    = "web"
    public_ip      = true
    admin_username = "azureuser"
    # DO NOT store passwords in version control
    # Use environment variables, Azure Key Vault, or other secure methods
    admin_password = "REPLACE_WITH_SECURE_PASSWORD"
    enable_backup  = true
  }
  web-02 = {
    vm_size        = "Standard_D2s_v3"
    subnet_name    = "web"
    public_ip      = true
    admin_username = "azureuser"
    admin_password = "REPLACE_WITH_SECURE_PASSWORD"
    enable_backup  = true
  }
  web-03 = {
    vm_size        = "Standard_D2s_v3"
    subnet_name    = "web"
    public_ip      = true
    admin_username = "azureuser"
    admin_password = "REPLACE_WITH_SECURE_PASSWORD"
    enable_backup  = true
  }
  app-01 = {
    vm_size        = "Standard_D4s_v3"
    subnet_name    = "app"
    private_ip     = "10.2.2.10"
    public_ip      = false
    admin_username = "azureuser"
    admin_password = "REPLACE_WITH_SECURE_PASSWORD"
    enable_backup  = true
  }
  app-02 = {
    vm_size        = "Standard_D4s_v3"
    subnet_name    = "app"
    private_ip     = "10.2.2.11"
    public_ip      = false
    admin_username = "azureuser"
    admin_password = "REPLACE_WITH_SECURE_PASSWORD"
    enable_backup  = true
  }
  app-03 = {
    vm_size        = "Standard_D4s_v3"
    subnet_name    = "app"
    private_ip     = "10.2.2.12"
    public_ip      = false
    admin_username = "azureuser"
    admin_password = "REPLACE_WITH_SECURE_PASSWORD"
    enable_backup  = true
  }
}
