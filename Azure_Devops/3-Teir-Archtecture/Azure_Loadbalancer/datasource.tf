data "azurerm_public_ip" "pip" {
    name = ""
    resource_group_name = ""
  
}
data "azurerm_virtual_network" "vnet" {
    name  ="" 
    resource_group_name = ""
}
data "azurerm_virtual_machine" "vms" {
    name = ""
    resource_group_name = ""
  
}