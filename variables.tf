variable "region" {
  description = "Nome da região AWS "
  type        = string
  default     = "sa-east-1"
}

variable "account_id" {
  description = "ID da conta AWS"
  type        = string
  default     = "637423356519"
}

variable "profile" {
  description = "Profile AWS Configure "
  type        = string
  default     = "notificacoes-prd"
}

variable "user_name" {
  description = "Nome do usuário criado para o velero"
  type        = string
  default     = "velero-notificacoes-prd"
}

variable "bucket_name" {
  description = "Nome do bucket (de preferencia nome do cluster eks) "
  type        = string
  default     = "velero-notificacoes-prd"
}

variable "cluster_name" {
  description = "Nome do Cluster EKS onde sera instalado o velero"
  type        = string
  sensitive   = true
  default     = "eks-microservicos-notifi-prd"
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
