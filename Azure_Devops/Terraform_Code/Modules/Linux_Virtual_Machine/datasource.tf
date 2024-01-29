data "azurerm_subnet" "subnet" {
  name                 = "my-subnet1"
  virtual_network_name = "HCl-Vnet01"
  resource_group_name  = "centralindia"
}

data "azurerm_key_vault" "keyvault" {
  name                = "Vmuserlogin-Somesh"
  resource_group_name = "Hcl-rg01"
}

data "azurerm_key_vault_secret" "keyvaultsecret1" {
  name         = "Administrator01"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}
data "azurerm_key_vault_secret" "keyvaultsecret2" {
  name         = "linuxvm-password"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}