resource "kubernetes_service" "pingpong" {
  metadata {
    name      = var.service_name
    namespace = "default"
  }

  spec {
    selector = {
      app = var.service_name
    }

    type      = "NodePort"
    node_port = 2000

    port {
      port        = 80
      target_port = 1357
    }

    session_affinity = "ClientIP"
  }
}
