################################################################################
# Network
################################################################################
output "resource_group_name" {
  description = "Resource Group 이름"
  value       = azurerm_resource_group.this.name
}

################################################################################
# Compute
################################################################################
output "web_url" {
  description = "nginx 접속 URL"
  value       = "http://${module.web.public_ip}"
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
