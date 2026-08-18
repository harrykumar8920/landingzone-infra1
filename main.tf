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
 resource "azurerm_resource_group" "rg4" {
  name     = "np-preprod-rg4"
  location = "Central India"

  tags = {
    environment = "preprod"
    managed_by  = "terraform"
  }
}