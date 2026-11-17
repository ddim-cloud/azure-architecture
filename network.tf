resource "azurerm_resource_group" "this" {
  name     = "rg-${var.name}"
  location = var.location
  tags     = var.tags
}

################################################################################
# Network Module (VNet, Subnet 3개, NSG)
################################################################################
module "network" {
  source  = "ddimtfe.ddimtech.click/SKAX/network/azurerm"
  version = "1.0.0"

  name                = var.name
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  vnet_cidr           = var.vnet_cidr
  web_subnet_cidr     = var.web_subnet_cidr
  db_subnet_cidr      = var.db_subnet_cidr
  aks_subnet_cidr     = var.aks_subnet_cidr
  admin_cidr          = var.admin_cidr
  tags                = var.tags
}
