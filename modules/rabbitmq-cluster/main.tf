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

resource "kubernetes_manifest" "deployment_manifest" {
  manifest = {
    "apiVersion" = "rabbitmq.com/v1beta1"
    "kind"       = "RabbitmqCluster"
    "metadata" = {
      "name"      = "rabbitmq-cluster"
      "namespace" = data.kubernetes_namespace_v1.default.metadata[0].name
    }
    "spec" = {
      "image"    = var.rabbit_image_name
      "replicas" = var.cluster_replica_count
    }
  }
}
