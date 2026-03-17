# =========================================================
# ☁️ Azure Configuration
# =========================================================

variable "subscription_id" {
  description = "Azure subscription ID where resources will be provisioned."
  type        = string
  default     = "45f251e8-d84d-4b8e-ac63-77eef4482127"
}

variable "location" {
  description = "Azure region for all resources."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group in which the AKS cluster will be created."
  type        = string
}

# =========================================================
# ☸️ AKS Cluster Configuration
# =========================================================

variable "cluster_name" {
  description = "Name of the AKS cluster."
  type        = string
}

variable "aks_dns_prefix" {
  description = "DNS prefix for the AKS cluster."
  type        = string
  default     = "aks-cluster-prefix"
}

# =========================================================
# 🖥️ Node Pool Configuration
# =========================================================

variable "node_pool_name" {
  description = "Name of the default node pool."
  type        = string
  default     = "default"
}

variable "node_count" {
  description = "Number of nodes in the default node pool."
  type        = number
  default     = 3
}

variable "node_vm_size" {
  description = "Size of the VMs in the default node pool."
  type        = string
}

# =========================================================
# 🌐 AKS Network Profile
# =========================================================

variable "network_profile" {
  description = "Network profile settings for the AKS cluster."
  type = object({
    network_plugin     = string  # "azure" or "kubenet"
    network_policy     = string  # e.g., "calico" or "azure"
    service_cidr       = string  # e.g., "10.0.0.0/16"
    dns_service_ip     = string  # e.g., "10.0.0.10"
    docker_bridge_cidr = string  # e.g., "172.17.0.1/16"
  })
}

# =========================================================
# 🌍 Virtual Network (VNet) and Subnet
# =========================================================

variable "vnet_name" {
  description = "Name of the virtual network to deploy AKS into."
  type        = string
  default     = "gocloud-dev-vnet"
}

variable "address_space" {
  description = "Address space for the virtual network."
  type        = list(string)
  default     = ["10.2.0.0/16"]
}

variable "subnet_name" {
  description = "Name of the subnet within the VNet."
  type        = string
  default     = "gocloud-dev-subnet"
}

variable "subnet_address_prefix" {
  description = "Address prefix for the subnet."
  type        = string
  default     = "10.2.0.0/24"
}

# =========================================================
# 🔑 Kubeconfig
# =========================================================

variable "kubeconfig_path" {
  description = "Path to the kubeconfig file used by kubectl to connect to the cluster."
  type        = string
  default     = "~/.kube/config"
}