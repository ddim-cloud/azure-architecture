# subscription_id, admin_cidr, ssh_public_key, postgres_password(Sensitive) 는 TFE Workspace Variable로 입력

# 공통
name = "skax"
tags = {
  Project   = "tfe-training"
  ManagedBy = "tfe"
}

# network.tf
vnet_cidr       = "10.10.0.0/16"
web_subnet_cidr = "10.10.1.0/24"  # WEB VM
db_subnet_cidr  = "10.10.2.0/24"  # PostgreSQL
aks_subnet_cidr = "10.10.16.0/20" # AKS 노드

# compute.tf - WEB VM
web_vm_size = "Standard_B2s_v2"

# compute.tf - AKS
kubernetes_version = "1.34"
node_vm_size       = "Standard_D2s_v5"
node_min_count     = 2
node_max_count     = 3

# database.tf
postgres_sku          = "B_Standard_B1ms"
postgres_storage_mb   = 32768
postgres_standby_zone = null
