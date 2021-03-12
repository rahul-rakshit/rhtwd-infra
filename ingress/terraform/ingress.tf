resource "kubernetes_ingress" "default_ingress" {
  metadata {
    name      = "default-ingress"
    namespace = "default"
    annotations = {
      "kubernetes.io/ingress.class" = "traefik"
    }
  }

  wait_for_load_balancer = true

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
