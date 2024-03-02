# 2. Environment Name
variable "environment" {
  description = "Environment Name"
  type = string
  default = "dev"
  #type = set(string)
  #default = ["dev", "stg", "prd"]
}
# 3. Resource Group Name
variable "resoure_group_name" {
  description = "Resource Group Name"
  type = string
  default = "rg"
}
# 4. Resource Group Location
variable "resoure_group_location" {
  description = "Resource Group Location"
  type = string
  default = "East US"
}

# 5. Virtual Network Name
variable "virtual_network_name" {
  description = "Virtual Network Name"
  type = string 
  default = "cos-vnet01"
}

# 2. Application Name
variable "Application_name" {
  description = "Application Name"
  type = string
  default = "essence"
  #type = set(string)
  #default = ["essence", "Infoware", "Shopify"]
}

# Define SKU for each VM
variable "VM_sku" {
  description = "Specify SKU per VM"
  type        = map
  default     = {
    "HTR1500" = "Standard_DS1_v2"
    "HTR1900" = "Standard_DS2_v2"
    "HTR1800" = "Standard_D2as_v4"
  }
}



variable "NSG_rule_name" {
  description = "List of Network Security Group name"
  type = map
  default = {
    "3389" : "Allow_RDP"
    "22"   : "Allow_SSH"
    "80"   : "Allow_Internet"
  }
}

# Define the data disks you want to create
variable "data_disks" {
  type = map(object({
    name                 = string
    disk_size_gb         = number
    create_option        = string
    caching              = string
    lun                  = number
    storage_account_type = string
  }))
  default = {
    "HTR1500" = {
      name                 = "data_disk_1"
      disk_size_gb         = 5
      create_option        = "Empty"
      caching              = "None"
      lun                  = 1
      storage_account_type = "Standard_LRS"
    },
    "HTR1800" = {
      name                 = "data_disk_2"
      disk_size_gb         = 10
      create_option        = "Empty"
      caching              = "WriteOnly"
      lun                  = 1
      storage_account_type = "Standard_LRS"
    },
    "HTR1900" = {
      name                 = "data_disk_3"
      disk_size_gb         = 10
      create_option        = "Empty"
      caching              = "WriteOnly"
      lun                  = 1
      storage_account_type = "Standard_LRS"
    }
  }
}

# Common tags
variable "common_tags" {
  description = "Common tags for Azure resources"
  type        = map
  default = {
    environment = "staging"
    department  = "IT"
    Owner      = "Hriyen"
    Cos_Managed = "yes"
  }
}