variable "kube_config" {
  type    = string
  default = "~/.kube/config"
}

variable "service_name" {
  type    = string
  default = "pingpong"
}


variable "namespace" {
  type    = string
  default = "staging"
}

variable "build_label" {
  type    = string
  default = "latest"
}
