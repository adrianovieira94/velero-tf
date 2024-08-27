provider "aws" {
  region              = var.region
  allowed_account_ids = [var.account_id]
  profile             = var.profile
}

# terraform {
#   backend "s3" {
#     bucket = "637423356519-tf"
#     key    = "velero-notificacoes-prod/terraform.tfstate"
#     region = "sa-east-1"
#   }
# }

module "install_velero" {
  source         = "./modules"
  region         = var.region
  bucket_name    = var.bucket_name
  user_name      = var.user_name
  cluster_name   = var.cluster_name
  aws_access_key = var.aws_access_key
  aws_secret_key = var.aws_secret_key
}