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

resource "kubernetes_service" "cassowary_prod" {
  metadata {
    name      = var.service_name
    namespace = "production"
  }

  spec {
    selector = {
      app = kubernetes_deployment.cassowary_prod.metadata.0.labels.app
    }

    port {
      port        = 80
      target_port = 8080
    }

    session_affinity = "ClientIP"
  }
}
