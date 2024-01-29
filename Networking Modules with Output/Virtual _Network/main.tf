resource "azurerm_virtual_network" "Virtual_Network" {
  for_each            = var.virtual_network_name
  name                = each.value.name
  address_space       = each.value.address_prefixes
  location            = data.azurerm_resource_group.resource_group.location.id
  resource_group_name = data.azurerm_resource_group.resource_group.name.id

dynamic "subnet" {

  for_each = var.subnet
  content {

    name           = subnet.value.name
    address_prefix = subnet.value.address_prefix
  }
}

}