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