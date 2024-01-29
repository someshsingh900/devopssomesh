rgs = {

  "rg01" = {
    name     = "hcl-Rg01"
    location = "centralindia"
  },
  "rg02" = {
    name     = "hcl-Rg02"
    location = "centralindia"
  },

}
vnet_map = {
  vnet_map01 = {
    name                = "Hcl-vnet01"
    location            = "centralindia"
    resource_group_name = "hcl-rg01"
    address_space       = ["10.0.0.0/16"]
  }
}
snets_map = {
  snets_map01 = {
    "name"           = "frontendsubnet"
    "address_prefix" = "10.0.1.0/16"
  },
  snets_map02 = {
    "name"           = "Backendsubnet"
    "address_prefix" = "10.0.2.0/16"
  },

  snets_map03 = {
    "name"           = "AzureBastionSubnet"
    "address_prefix" = "10.0.3.0/16"
  }


}
pips = {

  "pip01" = {
    "name"     = "hclpip01"
    "rg"       = "Hcl-rg"
    "location" = "centralindia"
  },
  "pip02" = {
    "name"     = "publicip01"
    "rg"       = "Hcl-rg"
    "location" = "centralindia"
  }
}
linuxvms = {
  "linuxvms01" = {
    name    = "hcl-vm01"
    rg_name = "hcl-rg01"
  },
  "linuxvms02" = {
    name    = "hcl-vm02"
    rg_name = "hcl-rg01"
  }


  nics = {
    nics01 = {
      name  = "FNIC1"
      sname = "FrontEnd_SUBNET"
    },
    Nics02 = {
      name  = "FNIC2"
      sname = "FrontEnd_SUBNET"
    },
    Nics03 = {
      name  = "BNIC1"
      sname = "BackEnd_SUBNET"
    }

  }
  lb  = "Load_Balancer"
  blb = "BackEnd_Pool"
  backendaddresspool_address = {
    backendaddresspool_address1 = {
      name = "Hcl-Vm01"
      vm   = "FrontEnd-VM1"
    },
    backendaddresspool_address2 = {
      name = "Hcl-Vm02"
      vm   = "FrontEnd-VM2"
    }
  }
}