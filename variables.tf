################################################################################
# Common
################################################################################
variable "location" {
  type        = string
  description = "Azure 리전"
  default     = "koreacentral"
}

variable "name" {
  type        = string
  description = "모든 리소스 이름에 붙는 suffix"
}

variable "tags" {
  type        = map(string)
  description = "공통 태그"
  default     = {}
}

################################################################################
# Network
################################################################################
variable "vnet_cidr" {
  type        = string
  description = "VNet 대역"
}

variable "web_subnet_cidr" {
  type        = string
  description = "WEB 서브넷 대역"
}

variable "db_subnet_cidr" {
  type        = string
  description = "DB 서브넷 대역"
}

variable "aks_subnet_cidr" {
  type        = string
  description = "AKS 노드 서브넷 대역"
}

variable "admin_cidr" {
  type        = string
  description = "관리자망 CIDR (WEB VM SSH, AKS API Server 접근 허용)"
}

################################################################################
# Compute
################################################################################
variable "web_vm_size" {
  type        = string
  description = "WEB VM 크기"
}

variable "kubernetes_version" {
  type        = string
  description = "AKS Kubernetes 버전"
}

variable "node_vm_size" {
  type        = string
  description = "AKS 노드 VM 크기"
}

variable "node_min_count" {
  type        = number
  description = "AKS 최소 노드 수"
}

variable "node_max_count" {
  type        = number
  description = "AKS 최대 노드 수"
}

################################################################################
# Database
################################################################################
variable "postgres_sku" {
  type        = string
  description = "PostgreSQL SKU"
}

variable "postgres_storage_mb" {
  type        = number
  description = "PostgreSQL 스토리지(MB)"
}

variable "postgres_standby_zone" {
  type        = string
  description = "PostgreSQL HA Standby zone. null이면 HA 끔"
  default     = null
}

