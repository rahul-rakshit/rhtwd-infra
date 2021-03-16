resource "kubernetes_ingress" "ingress" {
  metadata {
    name      = "ingress"
    namespace = var.namespace

    annotations = {
      "kubernetes.io/ingress.class"          = "nginx"
      "ingress.kubernetes.io/rewrite-target" = "/staging/$2"
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

          path = "/staging/(/|$)(.*)"
        }
      }
    }
  }
}

