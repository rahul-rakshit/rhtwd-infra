resource "kubernetes_ingress" "traefik" {
  metadata {
    name      = "traefik-ingress"
    namespace = "default"
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

resource "kubernetes_ingress_class" "traefik" {

}
