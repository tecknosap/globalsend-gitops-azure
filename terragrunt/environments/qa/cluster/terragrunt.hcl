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
  subscription_id     = "subscription-id-here"
  location            = "canadacentral"
  resource_group_name = "rg-aks-qa"

  # =========================================================
  # ☸️ AKS Cluster Configuration
  # =========================================================
  cluster_name   = "aks-cluster-qa"
  aks_dns_prefix = "aksqa"

  node_pool_name = "agentpool"
  node_count     = 2
  node_vm_size   = "standard_a2_v2"

  # =========================================================
  # 🌐 AKS Network Profile
  # =========================================================
  network_profile = {
    network_plugin     = "azure"
    network_policy     = "calico"
    service_cidr       = "10.10.0.0/16"
    dns_service_ip     = "10.10.0.10"
    docker_bridge_cidr = "172.17.0.1/16"
  }

  # =========================================================
  # 🌍 Virtual Network (VNet)
  # =========================================================
  vnet_name     = "gocloud-qa-vnet"
  address_space = ["10.3.0.0/16"]

  # =========================================================
  # 🔗 Subnet Configuration
  # =========================================================
  subnet_name           = "gocloud-qa-subnet"
  subnet_address_prefix = "10.3.0.0/24"
}