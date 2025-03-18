resource "azurerm_kubernetes_cluster" "AKS" {
  name                = var.AKS_name
  resource_group_name = var.AKS_RG_name
  location            = var.AKS_RG_location
  dns_prefix          = var.AKS_name

  default_node_pool {
    name       = "agent"
    node_count = var.AKS_node_count
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = var.AKS_network_plugin
  }
}

variable "AKS_name" {}

variable "AKS_RG_name" {}
variable "AKS_RG_location" {}
variable "AKS_node_count" {}
variable "AKS_network_plugin" {}

output "principalid" {
  value = azurerm_kubernetes_cluster.AKS.identity[0].principal_id
}

