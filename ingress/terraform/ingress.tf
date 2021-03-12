resource "kubernetes_ingress" "default_ingress" {
  metadata {
    name = "default-ingress"
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