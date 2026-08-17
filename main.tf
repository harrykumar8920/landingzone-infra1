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
 
 resource "azurerm_resource_group" "rg3" {
  name     = "np-preprod-rg3"
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
    depends_on = [
    azurerm_resource_group.rg   
  ]
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
    depends_on = [
    azurerm_resource_group.rg 
  ]
  name                = "frontend-vm-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.snet1.id
    private_ip_address_allocation = "Dynamic"
  }
}


