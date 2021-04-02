resource "kubernetes_deployment" "dummy_prod" {
  metadata {
    name      = "dummy-prod"
    namespace = "production"

    labels = {
      app = "dummy-prod"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "dummy-prod"
      }
    }

    template {
      metadata {
        labels = {
          app = "dummy-prod"
        }
      }
      spec {
        container {
          image = "nginx:latest"
          name  = "nginx"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "dummy_prod" {
  metadata {
    name      = "dummy-prod"
    namespace = "production"
  }

  spec {
    selector = {
      app = kubernetes_deployment.dummy_prod.metadata.0.labels.app
    }

    port {
      port        = 80
      target_port = 80
    }

    session_affinity = "ClientIP"
  }
}
