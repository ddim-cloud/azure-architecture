# PostgreSQL 서버 이름은 Azure 전역에서 고유해야 함 → 임의 6자리를 붙임
resource "random_string" "postgres_suffix" {
  length  = 6
  special = false
  upper   = false
}

resource "random_password" "postgres" {
  length           = 20
  min_upper        = 1
  min_lower        = 1
  min_numeric      = 1
  override_special = "!#%*-_"
}

module "postgres" {
  source  = "hctfe2.ddimtech.click/SKAX/postgres/azurerm"
  version = "1.0.0"

  name                = "psql-${var.name}-${random_string.postgres_suffix.result}"
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  subnet_id           = module.network.db_subnet_id
  vnet_id             = module.network.vnet_id

  sku_name     = var.postgres_sku
  storage_mb   = var.postgres_storage_mb
  standby_zone = var.postgres_standby_zone

  administrator_login    = "pgadmin"
  administrator_password = random_password.postgres.result
  databases              = ["app"]

  tags = var.tags
}
