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


resource "azurerm_virtual_network" "vm" {
  name                = "apni-vnet"
  location            = "Central India"
  resource_group_name = "np-prod-rg"
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name             = "frontend-subnet"
    address_prefixes = ["10.0.1.0/24"]
  }

  subnet {
    name             = "backend-subnet"
    address_prefixes = ["10.0.2.0/24"]
  }

  tags = {
    environment = "prod"
  }
}