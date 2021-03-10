resource "kubernetes_deployment" "echo_server" {
  metadata {
    name      = "pingpong"
    namespace = "default"
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "pingpong"
      }
    }
    template {
      metadata {
        labels = {
          app = "pingpong"
        }
      }
      spec {
        container {
          image = "rahulrakshit/pingpong:latest"
          name  = "pingpong"
          port {
            container_port = 1357
          }
        }
      }
    }
  }
}
