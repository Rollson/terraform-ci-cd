# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {

    # backend "azurerm" {
    #     resource_group_name  = "tfstate"
    #     storage_account_name = "tfstate261270108"
    #     container_name       = "tfstate"
    #     key                  = "terraform.tfstate"
    # }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}
