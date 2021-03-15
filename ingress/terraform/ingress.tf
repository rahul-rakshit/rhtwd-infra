resource "kubernetes_ingress" "traefik" {
  metadata {
    name      = "traefik"
    namespace = var.namespace

    annotations = {
      traefik.ingress.kubernetes.io / rule-type : "PathPrefixStrip: /staging"
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

          path = "/staging/pingpong/*"
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

