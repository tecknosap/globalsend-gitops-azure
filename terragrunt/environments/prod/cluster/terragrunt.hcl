include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../../terraform/cluster"
}

inputs = {
  # =========================================================
  # ☁️ Azure Configuration
  # =========================================================
  subscription_id     = "subscriptipon-id-here"
  location            = "canadacentral"
  resource_group_name = "rg-aks-prod"

  # =========================================================
  # ☸️ AKS Cluster Configuration
  # =========================================================
  cluster_name   = "aks-cluster-prod"
  aks_dns_prefix = "aksprod"

  node_pool_name = "agentpool"
  node_count     = 3
  node_vm_size   = "standard_d2s_v3"

  # =========================================================
  # 🌐 AKS Network Profile
  # =========================================================
  network_profile = {
    network_plugin     = "azure"
    network_policy     = "calico"
    service_cidr       = "10.20.0.0/16"
    dns_service_ip     = "10.20.0.10"
    docker_bridge_cidr = "172.17.0.1/16"
  }

  # =========================================================
  # 🌍 Virtual Network (VNet)
  # =========================================================
  vnet_name     = "gocloud-prod-vnet"
  address_space = ["10.4.0.0/16"]

  # =========================================================
  # 🔗 Subnet Configuration
  # =========================================================
  subnet_name           = "gocloud-prod-subnet"
  subnet_address_prefix = "10.4.0.0/24"
}