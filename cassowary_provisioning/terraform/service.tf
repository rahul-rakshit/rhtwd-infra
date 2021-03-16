resource "kubernetes_service" "cassowary" {
  metadata {
    name      = var.service_name
    namespace = var.namespace
  }

  spec {
    selector = {
      app = kubernetes_deployment.cassowary.metadata.0.labels.app
    }

    port {
      port        = 80
      target_port = 8080
    }

    session_affinity = "ClientIP"
  }
}

