terraform {
  required_version = ">= 1.8.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.21.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "66611367-84f3-4f44-9d45-bff8018fa0e0"
}