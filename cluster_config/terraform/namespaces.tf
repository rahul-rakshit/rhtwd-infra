resource "kubernetes_namespace" "staging" {
  name = "staging"
}

resource "kubernetes_namespace" "production" {
  name = "production"
}
