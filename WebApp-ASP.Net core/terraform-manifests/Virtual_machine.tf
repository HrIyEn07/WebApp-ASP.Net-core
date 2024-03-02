# Create the virtual machines
resource "azurerm_windows_virtual_machine" "VMs_01" {
  for_each = var.VM_sku

  name                  = each.key
  location              = azurerm_resource_group.HriyenRG.location
  resource_group_name   = azurerm_resource_group.HriyenRG.name
  #location            = data.azurerm_resource_group.existing_rg.location
  #resource_group_name = data.azurerm_resource_group.existing_rg.name
  network_interface_ids = [azurerm_network_interface.nic_01[each.key].id]
  size                  = each.value
  computer_name         = each.key
  admin_username        = local.username
  admin_password        = local.password
  provision_vm_agent    = true
  license_type          = "Windows_Server"
  tags = var.common_tags
  os_disk {
    name                = "${each.key}-Osdisk"
    caching             = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb        = 127
  }
  source_image_reference {
    publisher           = "MicrosoftWindowsServer"
    offer               = "WindowsServer"
    sku                 = "2019-Datacenter"
    version             = "latest"
  }
}
