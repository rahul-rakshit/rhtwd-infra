resource "kubernetes_ingress" "ingress" {
  metadata {
    name      = "ingress"
    namespace = var.ingress_namespace

    annotations = {
      "kubernetes.io/ingress.class" = "public"
    }
  }

  spec {
    rule {
      host = ""
      http {

        path {
          backend {
            service_name = "pingpong.staging.cluster.svc.local"
            service_port = 80
          }

          path = "/ping"
        }

        path {
          backend {
            service_name = "cassowary.staging.cluster.svc.local"
            service_port = 80
          }

          path = "/"
        }
      }
    }

    rule {
      host = "rhtwd.eu.ngrok.io"
      http {

        path {
          backend {
            service_name = "dummy-prod.production.cluster.svc.local"
            service_port = 80
          }

          path = "/"
        }
      }
    }
  }
}

