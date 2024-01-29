resource "azurerm_network_interface" "network_interface" {
    for_each = var.network_interface
  name                = each.value.name
  location            = data.azurerm_resource_group.rg.location.id
  resource_group_name = data.azurerm_resource_group.rg.id

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}