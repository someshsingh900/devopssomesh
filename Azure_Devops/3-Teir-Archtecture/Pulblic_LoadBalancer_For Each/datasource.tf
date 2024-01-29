data "azurerm_public_ip" "public_ip" {
  name                = "PublicIPForLB"
  resource_group_name = "hclrg01"
}

data "azurerm_virtual_network" "vnet" {
  name                = "hclvnet01"
  resource_group_name = "hclrg01"
}

data "azurerm_virtual_machine" "virtualmachine" {
  for_each = var.vm
  name                = each.value.name
  resource_group_name = var.rg_name
}