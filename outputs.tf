################################################################################
# Network
################################################################################
output "resource_group_name" {
  description = "Resource Group 이름"
  value       = azurerm_resource_group.this.name
}

output "vnet_id" {
  description = "VNet ID"
  value       = module.network.vnet_id
}

################################################################################
# Compute
################################################################################
output "web_url" {
  description = "nginx 접속 URL"
  value       = "http://${module.web.public_ip}"
}

output "web_ssh" {
  description = "WEB VM SSH 접속"
  value       = "ssh azureuser@${module.web.public_ip}"
}

output "web_ssh_private_key" {
  description = "WEB VM SSH 개인키"
  value       = tls_private_key.web.private_key_openssh
  sensitive   = true
}

output "aks_get_credentials" {
  description = "kubeconfig 가져오기"
  value       = "az aks get-credentials -g ${azurerm_resource_group.this.name} -n ${module.aks.name}"
}

################################################################################
# Database
################################################################################
output "postgres_fqdn" {
  description = "PostgreSQL FQDN (VNet 내부에서만 resolve)"
  value       = module.postgres.fqdn
}

output "postgres_password" {
  description = "PostgreSQL 관리자(pgadmin) 비밀번호"
  value       = random_password.postgres.result
  sensitive   = true
}
