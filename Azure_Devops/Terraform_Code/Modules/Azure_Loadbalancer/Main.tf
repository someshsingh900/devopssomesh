resource "azurerm_public_ip" "pip" {
  name                = "PublicIPForLB"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
}

resource "azurerm_lb" "lb" {
  name                = "TestLoadBalancer"
  location            = var.location
  resource_group_name =  var.rg_name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = data.azurerm_public_ip.pip.id
  }
}

resource "azurerm_lb_backend_address_pool" "backendaddresspool" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = "BackEndAddressPool"
}
resource "azurerm_lb_backend_address_pool_address" "backendpooladdresspooladdress" {
  for_each = var.vms
  name                                = each.value.backendaddresspool_name
  backend_address_pool_id             = azurerm_lb_backend_address_pool.backendaddresspool.id
   virtual_network_id      = data.azurerm_virtual_network.vnet.id
  ip_address  = data.azurerm_virtual_machine.virtualmachine[each.key].private_ip_address
}
resource "azurerm_lb_rule" "example" {
  loadbalancer_id                = azurerm_lb.l.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 3389
  backend_port                   = 3389
  frontend_ip_configuration_name = "PublicIPAddress"
  backend_address_pool_ids    =  [azurerm_lb_backend_address_pool.backendaddresspool.id]
}
resource "azurerm_lb_probe" "example" {
  loadbalancer_id = azurerm_lb.example.id
  name            = "ssh-running-probe"
  port            = 22
}