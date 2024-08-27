provider "aws" {
  region              = var.region
  allowed_account_ids = [var.account_id]
}

# terraform {
#   backend "s3" {
#     bucket = "637423356519-tf"
#     key    = "velero-notificacoes-prod/terraform.tfstate"
#     region = "sa-east-1"
#   }
# }

locals {
  access_key = env("AWS_ACCESS_KEY_ID")
  secret_key = env("AWS_SECRET_ACCESS_KEY")
}


module "install_velero" {
  source      = "./modules"
  region      = var.region
  secret_file = var.secret_file
  bucket_name = var.bucket_name
  user_name   = var.user_name
}