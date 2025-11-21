resource "azurerm_storage_account" "todoapp-storage" {
  name                     = var.storage_group_name
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}
