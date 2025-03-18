resource "azurerm_subnet" "Subnet" {
  name = var.Subnet_name
  resource_group_name = var.Subnet_RG_name
  virtual_network_name = var.Subnet_VNET_name
  address_prefixes = var.Subnet_IP
}

variable "Subnet_name" {}
variable "Subnet_RG_name" {}
variable "Subnet_VNET_name" {}
variable "Subnet_IP" {}

output "Subnet_id" {
    value = azurerm_subnet.Subnet.id
}