variable "kube_config" {
  type    = string
  default = "~/.kube/config"
}

variable "ingress_namespace" {
  type    = string
  default = "ingress"
}
