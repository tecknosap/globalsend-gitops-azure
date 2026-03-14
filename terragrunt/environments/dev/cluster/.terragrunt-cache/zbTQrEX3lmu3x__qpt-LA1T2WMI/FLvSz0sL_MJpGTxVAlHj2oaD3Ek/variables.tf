variable "resource_group_name" {
    description = "The name of the resource group in which to create the AKS cluster."
    type        = string
  
}
variable "location" {
    description = "The Azure region in which to create the AKS cluster."
    type        = string
  
}

variable "cluster_name" {
    description = "The name of the AKS cluster."
    type        = string
  
}
variable "node_pool_name" {
    description = "The name of the default node pool."
    type        = string
    default     = "default"
  
}

variable "node_count" {
    description = "The number of nodes in the default node pool."
    type        = number
    default     = 3
}

variable "node_vm_size" {
    description = "The size of the virtual machines in the default node pool."
    type        = string
    #default     = "standard_a2_v2"
  
}

variable "network_profile" {
  description = "The network profile for the AKS cluster."
  type = object({
    network_plugin     = string
    network_policy     = string
    service_cidr       = string
    dns_service_ip     = string
    docker_bridge_cidr = string
  })
}

variable "aks_dns_prefix" {
    description = "The DNS prefix for the AKS cluster."
    type        = string
    default = "aks-cluster-prefix"
  
}

# vnet and subnet
variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
  default = "gocloud-dev-vnet"

}

variable "address_space" { 
  description = "The address space for the virtual network"
  type        = list(string)
  default = [ "10.2.0.0/16" ]
  
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
    default     = "gocloud-dev-subnet"
}

variable "subnet_address_prefix" {
  description = "The address prefix for the subnet"
  type        = string
  default     = "10.2.0.0/24"
}


variable "subscription_id" {
  description = "The ID of the Azure subscription"
  type        = string
  default = "45f251e8-d84d-4b8e-ac63-77eef4482127"
}

# Path to the kubeconfig file used by kubectl to connect to the cluster
variable "kubeconfig_path" {
  description = "Path to kubeconfig file for the target cluster"
  type        = string
  default     = "~/.kube/config"
}


 