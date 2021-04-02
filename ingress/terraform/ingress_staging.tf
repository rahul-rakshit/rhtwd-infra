resource "kubernetes_ingress" "ingress_staging" {
  metadata {
    name      = "ingress-staging"
    namespace = var.staging_namespace

    annotations = {
      "kubernetes.io/ingress.class" = "public"
    }
  }

  spec {
    rule {
      host = var.staging_hostname
      http {

        path {
          path = "/ping"

          backend {
            service_name = "pingpong"
            service_port = 80
          }
        }

        path {
          path = "/"

          backend {
            service_name = "cassowary"
            service_port = 80
          }
        }
      }
    }
  }
}

