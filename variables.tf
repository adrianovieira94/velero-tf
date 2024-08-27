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
  description = "Nome do bucket (de preferencia nome do cluster eks) "
  type        = string
  default     = "notificacoes-prd"
}

variable "user_name" {
  description = "Nome do bucket (de preferencia nome do cluster eks) "
  type        = string
  default     = "velero-notificacoes-prd"
}

variable "bucket_name" {
  description = "Nome do bucket (de preferencia nome do cluster eks) "
  type        = string
  default     = "velero-notificacoes-prd"
}

variable "cluster_name" {
  type        = string
  sensitive   = true
  description = "AWS Secret Key"
  default     = "eks-microservicos-notifi-prd"
}

variable "aws_access_key" {
  type        = string
  sensitive   = true
  description = "AWS Acess Key"
}

variable "aws_secret_key" {
  type        = string
  sensitive   = true
  description = "AWS Secret Key"
}