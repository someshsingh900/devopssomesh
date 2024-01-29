
data "azurerm_subnet" "subnet" {
  name                 = "AzureBastionSubnet"
  virtual_network_name = "hcl-vnet01"
  resource_group_name  = "Hcl-Rg"


}

data "azurerm_public_ip" "public_ip" {
  name                = "hclpip01"
  resource_group_name = "HCl-Rg"

}