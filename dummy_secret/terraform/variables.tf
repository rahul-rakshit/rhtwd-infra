variable "kube_config" {
  type    = string
  default = "~/.kube/config"
}

variable "secret_name" {
  type    = string
  default = "chinese"
}

variable "namespace" {
  type = string
}

