resource "kubernetes_service" "ingress_publishing" {
  metadata {
    name      = "traefik"
    namespace = "kube-system"
  }

  spec {
    selector = {
      app = "traefik"
    }

    type = "NodePort"

    port {
      port        = 80
      target_port = 80
      node_port   = 30588
    }

    session_affinity = "ClientIP"
  }
}
