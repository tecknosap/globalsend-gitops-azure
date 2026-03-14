

########################
# Create monitoring namespace
########################
resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"
  }

  depends_on = [azurerm_kubernetes_cluster.this]
}

########################
# Deploy Prometheus + Grafana + Alertmanager
########################
resource "helm_release" "prometheus" {
  name      = "prometheus"
  namespace = kubernetes_namespace.monitoring.metadata[0].name

  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  version    = "80.13.3"

  values = [
    yamlencode({
      prometheus = {
        prometheusSpec = {
          serviceMonitorSelectorNilUsesHelmValues = false
          serviceMonitorSelector = {}
          podMonitorSelector     = {}
          service = { type = "NodePort" }
        }
      }
      grafana = {
        enabled       = true
        adminUser     = "admin"
        adminPassword = "ChangeMe123!"
        service = { type = "NodePort" }
      }
      alertmanager = { enabled = true }
    })
  ]

  depends_on = [kubernetes_namespace.monitoring]
}

########################
# Get Prometheus service
########################
data "kubernetes_service" "prometheus" {
  metadata {
    name      = "prometheus-kube-prometheus-prometheus"
    namespace = kubernetes_namespace.monitoring.metadata[0].name
  }

  depends_on = [helm_release.prometheus]
}

