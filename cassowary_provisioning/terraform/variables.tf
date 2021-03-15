variable "kube_config" {
  type    = string
  default = "~/.kube/config"
}

variable "service_name" {
  type    = string
  default = "cassowary"
}

variable "namespace" {
  type    = string
  default = "staging"
}

