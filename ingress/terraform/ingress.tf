resource "kubernetes_ingress" "traefik" {
  metadata {
    name      = "traefik"
    namespace = var.namespace

    annotations = {
      "kubernetes.io/ingress.class" = "traefik"
      "traefik.frontend.rule.type"  = "PathPrefixStrip"
    }
  }

  spec {
    rule {
      http {
        path {
          backend {
            service_name = "pingpong"
            service_port = 80
          }

          path = "/staging/ping"
        }

        path {
          backend {
            service_name = "cassowary"
            service_port = 80
          }

          path = "/staging/*"
        }
      }
    }
  }
}

