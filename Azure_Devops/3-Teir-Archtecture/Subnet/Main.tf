resource "azurerm_subnet" "Azuresubnet" {
    for_each = var.azsubnet
   name                 = each.value.name
  resource_group_name  = "hcl-rg"
  virtual_network_name = "hcl-vnet01"
  address_prefixes     = ["10.0.1.0/24"]
}