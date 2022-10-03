# # resource "azurerm_resource_group" "example" {
# #   name     = "example-resources"
# #   location = "West Europe"
# # }

# # resource "azurerm_virtual_network" "example" {
# #   name                = "example-network"
# #   address_space       = ["10.0.0.0/16"]
# #   location            = azurerm_resource_group.example.location
# #   resource_group_name = azurerm_resource_group.example.name
# # }

# # resource "azurerm_subnet" "example" {
# #   name                 = "internal"
# #   resource_group_name  = azurerm_resource_group.example.name
# #   virtual_network_name = azurerm_virtual_network.example.name
# #   address_prefixes     = ["10.0.2.0/24"]
# # }

# # resource "azurerm_network_interface" "example" {
# #   name                = "example-nic"
# #   location            = azurerm_resource_group.example.location
# #   resource_group_name = azurerm_resource_group.example.name

# #   ip_configuration {
# #     name                          = "internal"
# #     subnet_id                     = azurerm_subnet.example.id
# #     private_ip_address_allocation = "Dynamic"
# #   }
# # }

# # resource "azurerm_windows_virtual_machine" "example" {
# #   name                = "example-machine"
# #   resource_group_name = azurerm_resource_group.example.name
# #   location            = azurerm_resource_group.example.location
# #   size                = "Standard_F2"
# #   admin_username      = "adminuser"
# #   admin_password      = "P@$$w0rd1234!"
# #   network_interface_ids = [
# #     azurerm_network_interface.example.id,
# #   ]

# #   os_disk {
# #     caching              = "ReadWrite"
# #     storage_account_type = "Standard_LRS"
# #   }

# #   source_image_reference {
# #     publisher = "MicrosoftWindowsServer"
# #     offer     = "WindowsServer"
# #     sku       = var.win_os_image
# #     version   = "latest"
# #   }

# #   tags = {
# #     Name = "myVM-${local.project_name}"
# #   }

# # }



resource "azurerm_resource_group" "example" {
  name     = var.name
  location = "West Europe"
}

# module "linuxservers" {
#   source              = "Azure/compute/azurerm"
#   resource_group_name = azurerm_resource_group.example.name
#   vm_os_simple        = "UbuntuServer"
#   public_ip_dns       = ["linsimplevmips"] // change to a unique name per datacenter region
#   vnet_subnet_id      = module.network.vnet_subnets[0]

#   depends_on = [azurerm_resource_group.example]
# }

module "windowsservers" {
  source              = "Azure/compute/azurerm"
  resource_group_name = azurerm_resource_group.example.name
  is_windows_image    = true
  vm_hostname         = "mywinvm" // line can be removed if only one VM module per resource group
  admin_password      = "ComplxP@ssw0rd!"
  vm_os_simple        = "WindowsServer"
  public_ip_dns       = ["winsimplevmips"] // change to a unique name per datacenter region
  vnet_subnet_id      = module.network.vnet_subnets[0]

  depends_on = [azurerm_resource_group.example]
}

module "network" {
  source              = "Azure/network/azurerm"
  resource_group_name = azurerm_resource_group.example.name
  subnet_prefixes     = ["10.0.1.0/24"]
  subnet_names        = ["subnet1"]

  depends_on = [azurerm_resource_group.example]
}

