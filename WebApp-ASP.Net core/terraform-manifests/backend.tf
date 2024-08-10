terraform {
  backend "azurerm" {
  resource_group_name  = "terraform-rg10"
  storage_account_name = "terraformbackend0001"
  container_name       = "tfcontainer01"
  key                  = "terraform.tfstate"
  }
}
