terraform {
  backend "local" {
    path = "/media/apiatrist_vol_mount/terraform_state/rhtwd-infra/cassowary_provisioning/terraform.tfstate"
  }
}

