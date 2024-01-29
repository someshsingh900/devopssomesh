resource "azurerm_subnet" "Azuresubnet" {
    for_each = var.azsubnet
   name                 = each.value.name
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.vnet_name
  address_prefixes     = each.value.address_prefixes
}