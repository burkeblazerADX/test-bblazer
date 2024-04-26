resource "kubernetes_namespace_v1" "default" {
  count = var.create_namespace ? 1 : 0
  metadata {
    name = var.namespace
  }
}

data "kubernetes_namespace_v1" "default" {
  metadata {
    name = var.namespace
  }

  depends_on = [
    kubernetes_namespace_v1.default
  ]
}

resource "helm_release" "default" {
  name       = "rabbitmq-cluster-operator"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "rabbitmq-cluster-operator"
  version    = local.chart_version
  namespace  = data.kubernetes_namespace_v1.default.metadata[0].name
  timeout    = 900

  values = [
    yamlencode(
      {
        clusterOperator = {
          replicaCount = var.operator_replica_count
        }
      }
    )
  ]
}
