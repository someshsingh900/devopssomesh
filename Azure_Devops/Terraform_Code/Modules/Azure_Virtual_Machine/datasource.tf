data "azurerm_subnet" "subnet" {
  name                 = "hcl-subnet01"
  virtual_network_name = "hcl-vnet01"
  resource_group_name  = "hcl-rg"
}