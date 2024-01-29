

resource "azurerm_mysql_server" "sqlserver" {
  name                = "mysqlserver01"
  location            = var.location
  resource_group_name = var.rg

  administrator_login          = "mysqladminun"
  administrator_login_password = "H@Sh1CoR3!"

  sku_name   = "GP_Gen5_2"
  storage_mb = 5120
  version    = "5.7"

  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = true
  infrastructure_encryption_enabled = true
  public_network_access_enabled     = false
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"
}

resource "azurerm_mysql_database" "sqlserver" {
  name                = "mysqlserverdb01"
  resource_group_name = azurerm_resource_group.resource.name
  server_name         = azurerm_mysql_server.mysql.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}