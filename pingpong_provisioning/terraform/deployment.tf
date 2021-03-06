resource "kubernetes_deployment" "pingpong" {
  metadata {
    name      = var.service_name
    namespace = var.namespace

    labels = {
      app = var.service_name
    }
  }

  spec {
    replicas = var.replica_count
    selector {
      match_labels = {
        app = var.service_name
      }
    }

    template {
      metadata {
        labels = {
          app = var.service_name
        }
      }
      spec {
        container {
          image = "rahulrakshit/pingpong:${var.build_label}"
          name  = var.service_name
          port {
            container_port = 1357
          }
        }
      }
    }
  }
}
