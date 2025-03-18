resource "azurerm_resource_group" "RG" {
  name     = var.RG_name
  location = var.RG_location
}

variable "RG_name" {}
variable "RG_location" {}

output "RG_name" {
  value = azurerm_resource_group.RG.name
}

output "RG_location" {
  value = azurerm_resource_group.RG.location
}
