
terraform {
  backend "s3" {
    bucket  = "nops-terraform"
    encrypt = true
    workspace_key_prefix = "rds"
    key     = "ken/state.tfstate"
    region  = "us-west-2"
  }
}