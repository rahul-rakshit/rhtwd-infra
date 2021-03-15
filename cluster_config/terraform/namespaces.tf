resource "kubernetes_namespace" "staging" {
  name = "staging"

  metadata {
    name = "staging"
  }
}

resource "kubernetes_namespace" "production" {
  name = "production"

  metadata {
    name = "production"
  }
}
