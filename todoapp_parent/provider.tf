terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.33.0"
    }
  }

#   backend "azurerm" {
#     resource_group_name  = "rg-prabha"
#     storage_account_name = "krishnastg567"
#     container_name       = "tfstate"
#     key                  = "prod.terraform.tfstate"
#   }

}

provider "azurerm" {
  features {}
  subscription_id = "3a734e32-021d-4243-89ff-c3495e6aa4da"
}