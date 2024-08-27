data "aws_eks_cluster_auth" "default" {
  name = var.cluster_name
}

data "aws_caller_identity" "current" {}

provider "kubernetes" {
  config_path = "~/.kube/config"
  host                   = data.aws_eks_cluster.default.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.default.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.default.token
}

data "aws_eks_cluster" "default" {
  name = var.cluster_name
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}