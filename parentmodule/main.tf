module "rg-todoapp-infra" {
  source                  = "../azurerm_resource_group"
  resource_group_name     = "rg-todoapp-new"
  resource_group_location = "South India"

}

module "storage-todoapp-infra" {
  depends_on               = [module.rg-todoapp-infra]
  source                   = "../azurerm_storage_account"
  storage_group_name       = "sgtodoapp"
  resource_group_name      = "rg-todoapp-new"
  resource_group_location  = "South India"
  account_tier             = "Standard"
  account_replication_type = "GRS"

}

module "vnet-todoapp" {
  depends_on              = [module.rg-todoapp-infra]
  source                  = "../azurerm_virtual_network"
  resource_group_name     = "rg-todoapp-new"
  resource_group_location = "South India"
  vnet_name               = "vnet-todoapp"
  vnet_address            = ["10.0.0.0/24"]
}
module "frontend-subnet-todoapp" {
  depends_on          = [module.vnet-todoapp]
  source              = "../azurerm_subnet"
  resource_group_name = "rg-todoapp-new"
  vnet_name           = "vnet-todoapp"
  subnet_name         = "frontend-subnet"
  subnet_address      = ["10.0.0.0/28"]

}

module "backend-subnet-todoapp" {
  depends_on          = [module.vnet-todoapp]
  source              = "../azurerm_subnet"
  resource_group_name = "rg-todoapp-new"
  vnet_name           = "vnet-todoapp"
  subnet_name         = "backend-subnet"
  subnet_address      = ["10.0.0.16/28"]
}


module "public_ip" {
    depends_on = [ module.vnet-todoapp ]
    source = "../azurerm_public_ip"
    pip_name = "testpublic-ip"
    resource_group_name     = "rg-todoapp-new"
    resource_group_location = "South India"
    allocation_method = "Static"
}

# module "frontend-virtual-machine" {
#     depends_on = [ module.frontend-subnet-todoapp ]
#     source = "../azurerm_virtual_machine" 
#     nic_name = "nic-todoapp"
#     resource_group_name     = "rg-todoapp-new"
#     resource_group_location = "South India"
#     virtual_machine-todoapp = "frontend-VM"
#     vm-size = "Standard_F2"
#     admin_username = "adminuser"
#     admin_password = "Diksh@11061999"
# }



