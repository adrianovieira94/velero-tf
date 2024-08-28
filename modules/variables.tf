variable "region" {
  description = "Nome da região AWS "
  type        = string
}

variable "account_id" {
  description = "ID da conta AWS"
  type        = string
}

variable "profile" {
  description = "Profile AWS Configure "
  type        = string
}

variable "bucket_name" {
  description = "Nome do bucket (de preferencia nome do cluster eks) "
  type        = string
}

variable "user_name" {
  description = "Nome do usuário criado para o velero"
  type        = string
}

variable "cluster_name" {
  description = "Nome do Cluster EKS onde sera instalado o velero"
  type        = string
  sensitive   = true
}

variable "aws_access_key" {
  description = "AWS Acess Key"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
  type        = string
  sensitive   = true
}

