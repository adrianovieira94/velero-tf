provider "aws" {
  region              = var.region
  allowed_account_ids = [var.account_id]
  profile             = var.profile
}

terraform {
  backend "s3" {
    profile = "notificacoes-prd"
    bucket  = "velero-notificacoes-prd"
    key     = "TF_STATE/terraform.tfstate"
    region  = "sa-east-1"
  }
}

module "install_velero" {
  source         = "./modules"
  region         = var.region
  bucket_name    = var.bucket_name
  account_id     = var.account_id
  profile        = var.profile
  user_name      = var.user_name
  cluster_name   = var.cluster_name
  aws_access_key = var.aws_access_key
  aws_secret_key = var.aws_secret_key
}