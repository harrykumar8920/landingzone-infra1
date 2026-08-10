resource "azurerm_resource_group" "rg" {
  name     = "np-prod-rg"
  location = "Central India"

  tags = {
    environment = "prod"
    managed_by  = "terraform"
  }
}