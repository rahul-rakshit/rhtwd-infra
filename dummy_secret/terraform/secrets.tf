resource "kubernetes_secret" "chinese" {
  metadata {
    name      = var.secret_name
    namespace = var.namespace
  }

  data = {
    hello = var.chinese_hello
  }
}

