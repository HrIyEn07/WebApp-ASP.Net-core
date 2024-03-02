# Resource-1: Azure Resource Group

resource "azurerm_resource_group" "HriyenRG" {
  name = "HT-dev-rg"
  location = "West US"
}
