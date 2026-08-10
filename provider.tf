terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstate682026"
    container_name       = "tfstate"
    key                  = "landingzone.tfstate"
  }
}

provider "azurerm" {
  features {}
}