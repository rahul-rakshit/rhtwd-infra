terraform {
  backend "local" {
    path = "/media/apiatrist_vol_mount/terraform_state/rhtwd-infra/ingress/terraform.tfstate"
  }
}

provider "kubernetes" {
  config_path = var.kube_config
}
