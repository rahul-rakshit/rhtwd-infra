resource "kubernetes_secret" "chinese" {
  metadata {
    name      = "chinese"
    namespace = "staging"
  }

  data = {
    chinese-hello   = var.chinese_hello
    chinese-goodbye = var.chinese_goodbye
  }
}
