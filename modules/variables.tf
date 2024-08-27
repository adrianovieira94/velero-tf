variable "region" {
  description = "Nome da região AWS "
  type        = string
}

variable "bucket_name" {
  description = "Nome do bucket (de preferencia nome do cluster eks) "
  type        = string
}

variable "user_name" {
  description = "Nome do bucket (de preferencia nome do cluster eks) "
  type        = string
}

variable "secret_file" {
  description = "Acess_key e Secret_key"
  type        = string
  sensitive = true
}