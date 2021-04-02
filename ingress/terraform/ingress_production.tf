resource "kubernetes_ingress" "ingress_production" {
  metadata {
    name      = "ingress-production"
    namespace = var.production_namespace

    annotations = {
      "kubernetes.io/ingress.class" = "public"
    }
  }

  spec {
    rule {
      host = var.production_hostname
      http {
        path {
          path = "/"

          backend {
            service_name = "dummy-prod"
            service_port = 80
          }
        }
      }
    }
  }
}

