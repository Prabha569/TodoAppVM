module "resource_group" {
 source = "../modules/azurerm_resource_group"

  resource_group_name   = "rg-prabha"
  location              = "Central India"
}

module "vertual_network" {
  depends_on = [ module.resource_group ]
  source = "../modules/azurerm_virtual_network"

  virtual_network_name = "prabha-vnet"
  vnet_location        = "Central India"
  resource_group_name  = "rg-prabha"
  address_space        = ["10.0.0.0/16"]
}

module "frontend_subnet" {
  depends_on = [ module.vertual_network ]
  source = "../modules/azurerm_subnet"

  subnet_name          = "prabha-frontend-subnet"
  resource_group_name  = "rg-prabha"
  virtual_network_name =  "prabha-vnet"
  address_prefixes     = ["10.0.1.0/24"]
}

module "backend_subnet" {
  depends_on = [ module.vertual_network ]
  source = "../modules/azurerm_subnet"

  subnet_name          = "prabha-backend-subnet"
  resource_group_name  = "rg-prabha"
  virtual_network_name =  "prabha-vnet"
  address_prefixes     = ["10.0.2.0/24"]
}

module "frontend_pip" {
  source = "../modules/azurerm_public_ip"

  public_ip_name        = "prabha-frontend-pip"
  resource_group_name   = "rg-prabha"
  location              = "Central India"
  allocation_method     = "Static"
}

module "backend_pip" {
  source = "../modules/azurerm_public_ip"

  public_ip_name        = "prabha-backtend-pip"
  resource_group_name   = "rg-prabha"
  location              = "Central India"
  allocation_method     = "Static"
}

module "frontend-vm" {
  depends_on = [ module.frontend_subnet ]
  source = "../modules/azurerm_virtual_machine"

  network_interface_name  = "nic-frontendVM"
  nic_location            = "Central India"
  resource_group_name     = "rg-prabha" 
  virtual_machine_name    = "frontend-prabhaVM001"
  vm_location             = "Central India"
  vm_size                 = "Standard_F2"
  vm_admin_username       = "azureuser"
  vm_admin_password       = "prabha@123"
  disable_password_authentication = "false"
  image_publisher         = "Canonical"
  image_offer             = "0001-com-ubuntu-server-jammy"
  image_sku               = "22_04-lts"
  image_version           = "latest"
  data_subnet_name        = "prabha-frontend-subnet"
  virtual_network_name    = "prabha-vnet"
  data_public_ip_name     = "prabha-frontend-pip"

}

module "backend-vm" {
  depends_on = [ module.backend_subnet ]
  source = "../modules/azurerm_virtual_machine"

  network_interface_name  = "nic-backendVM"
  nic_location            = "Central India"
  resource_group_name     = "rg-prabha"
  virtual_machine_name    = "backend-prabhaVM002"
  vm_location             = "Central India"
  vm_size                 = "Standard_F2"
  vm_admin_username       = "azureuser"
  vm_admin_password       = "prabha@123"
  disable_password_authentication = "false"
  image_publisher         = "Canonical"
  image_offer             = "0001-com-ubuntu-server-jammy"
  image_sku               = "22_04-lts"
  image_version           = "latest"
  data_subnet_name        = "prabha-backend-subnet"
  virtual_network_name    = "prabha-vnet"
  data_public_ip_name     = "prabha-backtend-pip"
}

