resource "azurerm_network_interface" "nic-b" {
  name                = var.nic_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     =  var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

# resource "azurerm_network_security_group" "nsg-b" {
#   name                = "nsg-todoapp"
#   location            = "South India"
#   resource_group_name = "rg-todoapp-new"

#   security_rule {
#     name                       = "test123"
#     priority                   = 100
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "*"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }

#   tags = {
#     environment = "Production"
#   }
# }

resource "azurerm_linux_virtual_machine" "frontend-virt-mac" {
  name                = var.virtual_machine-todoapp
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  size                = var.vm-size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic-b.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.image_version
  }
}



