################################################################################
# WEB VM (nginx)
################################################################################
resource "tls_private_key" "web" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

module "web" {
  source  = "hctfe2.ddimtech.click/SKAX/vm/azurerm"
  version = "1.0.0"

  name                = "web-${var.name}"
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  subnet_id           = module.network.web_subnet_id
  vm_size             = var.web_vm_size
  zone                = "1"
  ssh_public_key      = tls_private_key.web.public_key_openssh
  public_ip           = true

  # 첫 부팅 때 1회 실행. 내용을 바꾸면 VM 재생성(-/+)
  custom_data = file("${path.module}/scripts/install-nginx.sh")

  tags = var.tags
}

################################################################################
# AKS (WAS 계층)
################################################################################
module "aks" {
  source  = "hctfe2.ddimtech.click/SKAX/aks/azurerm"
  version = "1.0.0"

  name                = var.name
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  subnet_id           = module.network.aks_subnet_id

  kubernetes_version = var.kubernetes_version
  node_vm_size       = var.node_vm_size
  node_min_count     = var.node_min_count
  node_max_count     = var.node_max_count

  # API Server는 관리자망에서만 접근
  authorized_ip_ranges = [var.admin_cidr]

  tags = var.tags
}
