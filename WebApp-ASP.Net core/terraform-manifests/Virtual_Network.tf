# Create Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "cos-vnet01"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.HriyenRG.location
  resource_group_name = azurerm_resource_group.HriyenRG.name
}

# Create Subnet
resource "azurerm_subnet" "Subnet" {
  name                 = "CosDevSubnet"
  resource_group_name  = azurerm_resource_group.HriyenRG.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
  service_endpoints = ["Microsoft.Sql", "Microsoft.Storage"]
}


# Create the network interfaces for each VM
resource "azurerm_network_interface" "nic_01" {
  
  for_each = var.VM_sku

  name                = "${each.key}-nic01"
  location            = azurerm_resource_group.HriyenRG.location
  resource_group_name = azurerm_resource_group.HriyenRG.name

  ip_configuration {
    name                          = "${each.key}-ipv4"
    subnet_id                     = azurerm_subnet.Subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.Public-ip[each.key].id
  }
}
# Create Public IP Address
resource "azurerm_public_ip" "Public-ip" {
  for_each = var.VM_sku
  name                = "${each.key}-public-ip01"
  resource_group_name = azurerm_resource_group.HriyenRG.name
  location            = azurerm_resource_group.HriyenRG.location
  allocation_method   = "Static"
  sku = "Standard"
  sku_tier = "Regional"
  #domain_name_label = "hrapp-${each.key}-${random_string.myrandom.id}"  
}


#- Create Newtork Security group
resource "azurerm_network_security_group" "nsg" {
  name                = "${var.environment}-nsg-01"
  location            = azurerm_resource_group.HriyenRG.location
  resource_group_name = azurerm_resource_group.HriyenRG.name
  dynamic "security_rule" {
    for_each = local.ports 
    content {
      name                       = "inbound-rule-${security_rule.key}"
      #name                       = "inbound-rule-${security_rule.value}"
      description                = "Inbound Rule ${security_rule.key}"    
      priority                   = sum([100, security_rule.key])
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = security_rule.value
      destination_port_range     = security_rule.value
      source_address_prefix      = "*"
      destination_address_prefix = "*"      
   }
 }
}
# Associate Network Seccurity group with Subnet
resource "azurerm_subnet_network_security_group_association" "Associate-nsg" {
  subnet_id = azurerm_subnet.Subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
