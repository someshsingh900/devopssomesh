data "azurerm_resource_group" "datarg" {
  name = "Resoure_Group"
}

data "azurerm_subnet" "subnet" {
    for_each = var.subnet
  name                 = each.value.subnetname
  virtual_network_name = "Virtual_Network"
  resource_group_name  = data.azurerm_resource_group.datarg.name
}