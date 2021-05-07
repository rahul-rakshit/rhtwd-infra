variable "kube_config" {
  type    = string
  default = "~/.kube/config"
}

variable "staging_namespace" {
  type    = string
  default = "staging"
}

variable "production_namespace" {
  type    = string
  default = "production"
}

variable "staging_hostname" {
  type    = string
  default = "staging-rhtwd.eu.ngrok.io"
}

variable "production_hostname" {
  type    = string
  default = "rhtwd.eu.ngrok.io"
}

variable "chinese_hello" {
  type = string
}
