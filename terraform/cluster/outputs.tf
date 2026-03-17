# =========================================================
# ☸️ AKS Cluster Outputs
# =========================================================

output "aks_cluster_name" {
  description = "Name of the AKS cluster."
  value       = azurerm_kubernetes_cluster.this.name
}

output "aks_cluster_id" {
  description = "Resource ID of the AKS cluster."
  value       = azurerm_kubernetes_cluster.this.id
}

output "kube_config" {
  description = "Raw kubeconfig content for the AKS cluster (sensitive)."
  value       = azurerm_kubernetes_cluster.this.kube_config_raw
  sensitive   = true
}

# =========================================================
# 🌐 Networking Outputs
# =========================================================

output "network_id" {
  description = "Resource ID of the virtual network."
  value       = azurerm_virtual_network.this.id
}