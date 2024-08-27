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

variable "cluster_name" {
  type        = string
  sensitive   = true
  description = "AWS Secret Key"
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

