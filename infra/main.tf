resource "azurerm_resource_group" "example" {
  name     = var.rg_name
  location = var.rg_location
}

module vnet {
  source = "./modules/virtualnet"

  vnet_name    = var.vnet_name
  rg_name      = azurerm_resource_group.example.name
  rg_location  = azurerm_resource_group.example.location
  subnet_name  = var.subnet_name
}

module network_interface {
  source = "./modules/networkInterface"

  nic_name    = var.nic_name
  rg_name      = azurerm_resource_group.example.name
  rg_location  = azurerm_resource_group.example.location
  subnet_id = module.vnet.subnet_id
}

module vm {
  source = "./modules/vm"

  vm_name    = var.vm_name
  rg_name      = azurerm_resource_group.example.name
  rg_location  = azurerm_resource_group.example.location
  network_interface_ids = [module.network_interface.nic_id]
}