resource "azurerm_resource_group" "rg" {
  name     = "np-prod-rg"
  location = "Central India"

  tags = {
    environment = "prod"
    managed_by  = "terraform"
  }
}
resource "azurerm_resource_group" "rg2" {
  name     = "np-preprod-rg2"
  location = "Central India"

  tags = {
    environment = "preprod"
    managed_by  = "terraform"
  }
}


resource "azurerm_virtual_network" "vnet" {
  name                = "apni-vnet"
  location            = "Central India"
  resource_group_name = "np-prod-rg"
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "snet1" {
  name                 = "frontend-subnet"
  resource_group_name  = "np-prod-rg"
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "snet2" {
  name                 = "backend-subnet"
  resource_group_name  = "np-prod-rg"
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "frontend_nic" {
  name                = "frontend-vm-nic"
  location            = "Central India"
  resource_group_name = "np-prod-rg"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.snet1.id
    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_virtual_machine" "frontend_vm_check" {
  name                  = "frontend-vm"
  location              = "Central India"
  resource_group_name   = "np-prod-rg"
  network_interface_ids = [azurerm_network_interface.frontend_nic.id]
  vm_size               = "Standard_B2ms"

  storage_os_disk {
    name              = "frontend-vm-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  os_profile {
    computer_name  = "frontend-vm"
    admin_username = "azureadmin"
    admin_password = "ChangeMe123!StrongPassword"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = {
    environment = "prod"
    managed_by  = "terraform"
  }
}