module "resource_group" {
  source = "../../Modules/Resource_Group"
  rg     = var.rgs
}
module "Azure_Virtual_Network" {
  depends_on = [module.resource_group]
  source     = "../../Modules/Virtual_Network"
  vnets      = var.vnet_map
  subnet     = var.snets_map

}
module "pip" {
  depends_on = [module.resource_group]
  source     = "../../Modules/pip"
  pip        = var.pips

}
module "azurerm_network_interface" {
  depends_on = [module.resource_group, module.Azure_Virtual_Network]
  source     = "../../Modules/nic"
  nic        = var.nics

}
module "Azure_Virtual_Machine" {
  depends_on = [module.resource_group, module.nic, module.Azure_key_vault]
  source     = "../../Modules/Azure_Virtual_Machine"
  vms        = vars.linuxvms


}
module "Azure_key_vault" {
  source     = "../../Modules/Azure_key_vault"
  azkeyvault = var.azkeyvaults
  depends_on = [module.resource_group, module.pip, module.Azure_Virtual_Network]
}
module "Azurerm_Loadbalance" {
  source                    = "../../Modules/Public_LoadBalancer_For Each"
  loadbalancer               = var.loadbalancer
  backendaddresspool         = var.backendaddresspool
  backendaddresspool_address = var.backendaddresspool_address
  depends_on                 = [module.resource_group, module.Azure_Virtual_Machine]
}


