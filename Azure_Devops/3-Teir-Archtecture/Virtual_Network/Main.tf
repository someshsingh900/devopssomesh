

resource "azurerm_virtual_network" "azure_VirtualNetwork01" {

  name                = "HCl-Vnet01"
  location            = "centralindia"
  resource_group_name = "Hcl-Rg"
  address_space       = ["10.0.0.0/16"]
  
   dynamic "subnet"{
   
   for_each = var.subnet
   content {
    
    name           = subnet.value.name 
    address_prefix = subnet.value.address_prefix
   }
   }
}

