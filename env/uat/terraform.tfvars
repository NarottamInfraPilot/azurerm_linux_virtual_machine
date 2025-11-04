# UAT environment configuration
tags = {
  "owner"       = "platform-team"
  "environment" = "uat"
  "cost-center" = "uat-001"
  "criticality" = "medium"
}

subnets = {
  web = {
    address_prefix = "10.1.1.0/24"
    service        = "web"
    enable_nsg     = true
  }
  app = {
    address_prefix = "10.1.2.0/24"
    service        = "app"
    enable_nsg     = true
  }
  db = {
    address_prefix = "10.1.3.0/24"
    service        = "db"
    enable_nsg     = true
  }
}

vms = {
  web-01 = {
    vm_size        = "Standard_B2s" # Larger size for UAT
    subnet_name    = "web"
    public_ip      = true
    admin_username = "azureuser"
    # DO NOT store passwords in version control
    # Use environment variables, Azure Key Vault, or other secure methods
    admin_password = "REPLACE_WITH_SECURE_PASSWORD"
    enable_backup  = true
  }
  web-02 = {
    vm_size        = "Standard_B2s"
    subnet_name    = "web"
    public_ip      = true
    admin_username = "azureuser"
    admin_password = "REPLACE_WITH_SECURE_PASSWORD"
    enable_backup  = true
  }
  app-01 = {
    vm_size        = "Standard_B2ms"
    subnet_name    = "app"
    private_ip     = "10.1.2.10"
    public_ip      = false
    admin_username = "azureuser"
    admin_password = "REPLACE_WITH_SECURE_PASSWORD"
    enable_backup  = true
  }
  app-02 = {
    vm_size        = "Standard_B2ms"
    subnet_name    = "app"
    private_ip     = "10.1.2.11"
    public_ip      = false
    admin_username = "azureuser"
    admin_password = "REPLACE_WITH_SECURE_PASSWORD"
    enable_backup  = true
  }
}
