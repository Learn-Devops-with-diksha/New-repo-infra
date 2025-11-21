resource "azurerm_mssql_database" "sqldb" {
  name           = var.sql_db_name
  server_id      = var.server_id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 4
  sku_name       = "S0"
}

