resource "kubernetes_service" "pingpong" {
  metadata {
    name      = var.service_name
    namespace = "default"
  }

  spec {
    selector = {
      app = kubernetes_deployment.pingpong.metadata.0.labels.app
    }

    type = "NodePort"

    port {
      port        = 80
      target_port = 1357
      node_port   = 30001
    }

    session_affinity = "ClientIP"
  }
}
