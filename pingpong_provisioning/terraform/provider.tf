terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.0.1"
    }
  }
}

provider "kubernetes" {
  config_path = var.kube_config
}
