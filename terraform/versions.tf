terraform {
  required_version = ">= 1.8.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.21.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-book-db-01"
    storage_account_name = "bookdbinfrastate44"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  } 
}

provider "azurerm" {
  features {}
}