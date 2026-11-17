# Azure 인증(ARM_*)만 TFE Variable Set으로 입력. SSH 키 · DB 비밀번호는 코드에서 자동 생성

# 공통
name = "skax"
tags = {
  Project   = "tfe-training"
  ManagedBy = "tfe"
  Owner     = "infra-team"
}

# network.tf
vnet_cidr       = "10.10.0.0/16"
web_subnet_cidr = "10.10.1.0/24"     # WEB VM
db_subnet_cidr  = "10.10.2.0/24"     # PostgreSQL
aks_subnet_cidr = "10.10.16.0/20"    # AKS 노드
admin_cidr      = "59.13.125.146/32" # 관리자 공인 IP (curl ifconfig.me)

# compute.tf - WEB VM
web_vm_size = "Standard_D2s_v5"

# compute.tf - AKS
kubernetes_version = "1.34"
node_vm_size       = "Standard_D2ds_v5"
node_min_count     = 2
node_max_count     = 3

# database.tf
postgres_sku          = "GP_Standard_D2ds_v5"
postgres_storage_mb   = 32768
postgres_standby_zone = null
