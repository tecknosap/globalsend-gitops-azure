include "root" {
path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../../terraform/cluster"
}

inputs = {
subscription_id     = "45f251e8-d84d-4b8e-ac63-77eef4482127"

resource_group_name = "rg-aks-dev"
location            = "canadacentral"

cluster_name        = "aks-cluster-dev"
aks_dns_prefix      = "aksdev"

node_pool_name      = "agentpool"
node_count          = 3
node_vm_size        = "standard_a2_v2"

# AKS network profile

network_profile = {
network_plugin      = "azure"
network_policy      = "calico"
service_cidr        = "10.0.0.0/16"
dns_service_ip      = "10.0.0.10"
docker_bridge_cidr  = "172.17.0.1/16"
}

# VNet configuration

vnet_name             = "gocloud-dev-vnet"
address_space         = ["10.2.0.0/16"]

# Subnet configuration

subnet_name           = "gocloud-dev-subnet"
subnet_address_prefix = "10.2.0.0/24"
}
