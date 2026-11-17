locals {
  # PostgreSQL 이름은 Azure 전역에서 고유해야 해서 구독 ID 기반 고유값을 붙임
  unique = substr(sha1(var.subscription_id), 0, 6)
}

module "postgres" {
  source  = "hctfe2.ddimtech.click/SKAX/postgres/azurerm"
  version = "1.0.0"

  name                = "psql-${var.name}-${local.unique}"
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  subnet_id           = module.network.db_subnet_id
  vnet_id             = module.network.vnet_id

  sku_name     = var.postgres_sku
  storage_mb   = var.postgres_storage_mb
  standby_zone = var.postgres_standby_zone

  administrator_login    = "pgadmin"
  administrator_password = var.postgres_password
  databases              = ["app"]

  tags = var.tags
}
