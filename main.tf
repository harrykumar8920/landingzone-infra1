resource "azurerm_resource_group" "rg" {
  name     = "np-prod-rg"
  location = "Central India"

  tags = {
    environment = "prod"
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

resource "azurerm_resource_group" "rg5" {
  name     = "locked-resource-group"
  location = "West Europe"
}

resource "azurerm_resource_group" "rg6" {
  name     = "locked-resource-group-hk"
  location = "West Europe"
}

resource "azurerm_management_lock" "resource-group-level" {
  name       = "resource-group-hk"
  scope      = azurerm_resource_group.rg6.id
  lock_level = "ReadOnly"
  notes      = "This Resource Group is Read-Only"
}

