resource "azurerm_virtual_network" "VNET" {
  name                = var.VNET_name
  resource_group_name = var.VNET_RG_name
  location            = var.VNET_RG_location
  address_space       = var.VNET_IP
}



variable "VNET_name" {}
variable "VNET_RG_name" {}
variable "VNET_RG_location" {}
variable "VNET_IP" {}


output "VNET_id" {
  value = azurerm_virtual_network.VNET.id
}


