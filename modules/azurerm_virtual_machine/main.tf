
resource "azurerm_network_interface" "network_interface" {
  name                = var.network_interface_name
  location            = var.nic_location
  resource_group_name = var.resource_group_name

  ip_configuration {
    public_ip_address_id          = data.azurerm_public_ip.data_public_ip.id
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.data_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "virtual_machine" {
  name                = var.virtual_machine_name
  resource_group_name = var.resource_group_name
  location            = var.vm_location
  size                = var.vm_size
  admin_username      = var.vm_admin_username
  admin_password      = var.vm_admin_password
  disable_password_authentication  = var.disable_password_authentication
  network_interface_ids = [
    azurerm_network_interface.network_interface.id,
  ]

  # admin_ssh_key {
  #   username   = "adminuser"
  #   public_key = file("~/.ssh/id_rsa.pub")
  # }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher =  var.image_publisher
    offer     =  var.image_offer
    sku       =  var.image_sku
    version   =  var.image_version
  }
}