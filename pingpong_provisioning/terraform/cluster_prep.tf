resource "kubernetes_cluster_role" "allow_port_forward" {
  metadata {
    name = "allow-port-forward"
  }

  rule {
    verbs      = ["get", "list", "create"]
    api_groups = [""]
    resources  = ["pods", "pods/portforward"]
  }
}

resource "kubernetes_cluster_role_binding" "allow_port_forward" {
  metadata {
    name = "allow-port-forward"
  }

  subject {
    kind = "User"
    name = "admin"
  }

  role_ref {
    kind      = "ClusterRole"
    name      = "allow-port-forward"
    api_group = "rbac.authorization.k8s.io"
  }
}

