data "azurerm_network_interface" "nic_data" {
  name                = var.nic_data_name
  resource_group_name = var.resource_group_name
}

data "azurerm_network_security_group" "nsg_data" {
  name                = var.nsg_data_name
  resource_group_name = var.resource_group_name
}
 

