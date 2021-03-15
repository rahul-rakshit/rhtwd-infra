resource "kubernetes_ingress" "traefik" {
  metadata {
    name      = "traefik"
    namespace = var.namespace
  }

  spec {
    ingress_class_name = "traefik-internal"

    backend {
      service_name = "pingpong"
      service_port = 80
    }

    rule {
      http {
        path {
          backend {
            service_name = "pingpong"
            service_port = 80
          }

          path = "/pingpong"
        }

        path {
          backend {
            service_name = "cassowary"
            service_port = 80
          }

          path = "/"
        }
      }
    }
  }
}

resource "kubernetes_ingress" "traefik_prod" {
  metadata {
    name      = "traefik"
    namespace = "production"
  }

  spec {
    ingress_class_name = "traefik-internal"

    rule {
      http {
        path {
          backend {
            service_name = "cassowary"
            service_port = 80
          }

          path = "/"
        }
      }
    }
  }
}

