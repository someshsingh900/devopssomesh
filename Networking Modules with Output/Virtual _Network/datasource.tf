data "azurerm_resource_group" "resource_group" {
  name = "hcl-rg01"
}

data "azurerm_subnet" "subnet" {
    for_each = var.subnet
  name                 = each.value.subnetname
  virtual_network_name = "hcl-vnet01"
  resource_group_name  = data.azurerm_resource_group.resource_group.name
}