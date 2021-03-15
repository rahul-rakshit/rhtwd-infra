resource "kubernetes_deployment" "cassowary" {
  metadata {
    name      = var.service_name
    namespace = var.namespace

    labels = {
      app = var.service_name
    }
  }

  spec {
    replicas = 2
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
          image = "rahulrakshit/cassowary:latest"
          name  = var.service_name
          port {
            container_port = 8080
          }
        }
      }
    }
  }
}

resource "kubernetes_deployment" "cassowary_prod" {
  metadata {
    name      = "${var.service_name}-prod"
    namespace = "production"

    labels = {
      app = var.service_name
    }
  }

  spec {
    replicas = 2
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
          image = "rahulrakshit/cassowary:latest"
          name  = var.service_name
          port {
            container_port = 8080
          }
        }
      }
    }
  }
}
