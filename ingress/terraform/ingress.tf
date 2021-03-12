resource "kubernetes_ingress" "traefik_ingress" {
  metadata {
    name      = "traefik-ingress"
    namespace = "default"
    annotations = {
      "kubernetes.io/ingress.class" = "traefik"
    }
  }

  spec {
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

          path = "/*"
        }
      }
    }
  }
}
