resource "azurerm_container_registry" "ACR" {
  name                = var.ACR_name
  resource_group_name = var.ACR_RG_name
  location            = var.ACR_RG_location
  sku                 = "Standard"
}

variable "ACR_name" {}
variable "ACR_RG_name" {}
variable "ACR_RG_location" {}

output "ACR_id" {
  value = azurerm_container_registry.ACR.id
}
