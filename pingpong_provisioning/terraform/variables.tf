variable "kube_config" {
  type    = string
  default = "~/.kube/config"
}

variable "service_name" {
  type    = string
  default = "pingpong"
}

variable "replica_count" {
  type    = number
  default = 2
}

variable "namespace" {
  type = string
}

variable "build_label" {
  type = string
}
