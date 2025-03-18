module "RG-01" {
  source      = "../Modules/RG"
  RG_name     = "Cluster-RG"
  RG_location = "Central India"
}

module "ACR-01" {
  source          = "../Modules/ACR"
  ACR_name        = "TejaACR"
  ACR_RG_name     = module.RG-01.RG_name
  ACR_RG_location = module.RG-01.RG_location
}

module "Cluster-01" {
  source             = "../Modules/Kubernetes"
  AKS_name           = "Teja-Cluser"
  AKS_RG_name        = module.RG-01.RG_name
  AKS_RG_location    = module.RG-01.RG_location
  AKS_node_count     = "2"
  AKS_network_plugin = "azure"
}

resource "azurerm_role_assignment" "ACR-AKS" {
  principal_id                     = module.Cluster-01.principalid
  role_definition_name             = "AcrPull"
  scope                            = module.ACR-01.ACR_id
  skip_service_principal_aad_check = true
}
