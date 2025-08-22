terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.33.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-rama"
    storage_account_name = "krishnastg5678"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }

}

provider "azurerm" {
  features {}
  subscription_id = "9a19641f-a0da-455d-9b90-51dc0d0cdfee"
}