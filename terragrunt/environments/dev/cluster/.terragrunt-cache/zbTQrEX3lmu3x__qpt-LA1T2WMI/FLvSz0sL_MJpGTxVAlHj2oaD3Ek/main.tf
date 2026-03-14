

resource "azurerm_kubernetes_cluster" "this" {
    name                = var.cluster_name
    location            = var.location
    resource_group_name = var.resource_group_name
    dns_prefix         = var.aks_dns_prefix

    default_node_pool {
        name       = var.node_pool_name
        node_count = var.node_count
        vm_size    = var.node_vm_size
        vnet_subnet_id = azurerm_subnet.this.id 
    }

    network_profile {
        network_plugin     = var.network_profile.network_plugin
        network_policy     = var.network_profile.network_policy
        service_cidr       = var.network_profile.service_cidr
        dns_service_ip     = var.network_profile.dns_service_ip
       # docker_bridge_cidr = var.network_profile.docker_bridge_cidr
    }

      identity {
    type = "SystemAssigned"
  }
  node_resource_group = "aks-nodes-${var.resource_group_name}"
}

