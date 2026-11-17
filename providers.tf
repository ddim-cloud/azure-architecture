# 인증 정보는 코드에 두지 않고 TFE Variable Set의 환경 변수로 주입
#   ARM_TENANT_ID, ARM_CLIENT_ID, ARM_CLIENT_SECRET
provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}
