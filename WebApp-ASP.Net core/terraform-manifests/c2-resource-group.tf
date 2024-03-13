# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "myrg" {
  name = "cherry-pick-rg01"
  location = "East US"
}

# This is for blame!

# file added

# This is from Dev branch! Work is in progress!
