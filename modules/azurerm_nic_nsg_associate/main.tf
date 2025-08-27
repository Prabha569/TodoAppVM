resource "azurerm_network_interface_security_group_association" "nsg_associate" {
  network_interface_id      = data.azurerm_network_interface.nic_data.id
  network_security_group_id = data.azurerm_network_security_group.nsg_data.id
}