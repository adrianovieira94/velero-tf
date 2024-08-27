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

variable "user_name" {
  description = "Nome do bucket (de preferencia nome do cluster eks) "
  type        = string
  default     = ""
}

variable "bucket_name" {
  description = "Nome do bucket (de preferencia nome do cluster eks) "
  type        = string
  default     = "teste"
}

variable "secret_file" {
  description = "Acess_key e Secret_key"
  type        = string
  sensitive   = true
}