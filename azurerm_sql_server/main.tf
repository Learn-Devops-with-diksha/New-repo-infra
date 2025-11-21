resource "azurerm_mssql_server" "sql-ser" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.resource_group_location
  version                      = var.sql_version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password

  tags = {
    environment = "production"
  }
}