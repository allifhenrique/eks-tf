locals {
  account_id  = "857378965163"
  # Tags comuns para todos os recursos
  common_tags = {
    project = "urbanfood"
    deploy  = "terraform"
  }
}

variable "aws_region" {
  description = "região utilizada"
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "profile utilizado no deploy"
  type        = string
  default     = "gvenunes"
}

variable "cluster_name" {
  description = "Nome do cluster EKS"
  type        = string
  default     = "eks-urbanfood"
}

variable "instance_type" {
  description = "Tipo de instancia usada no EKS"
  type        = string
  default     = "t3a.micro"
}

variable "list_instance_type" {
  description = "Tipo de instancia usada no EKS"
  type        = list(string)
  default     = ["t3a.micro", "t3a.medium"]
}

variable "vpc_cidr" {
  description = "CIDR IPv4 VPC"
  default = "10.82.0.0/20"
}

variable "subnet_private-us-east-1a" {
  description = "CIDR private subnet us-east-1a"
  default = "10.82.8.0/24"
}

variable "subnet_private-us-east-1b" {
  description = "CIDR private subnet us-east-1b"
  default = "10.82.9.0/24"
}

variable "subnet_public-us-east-1a" {
  description = "CIDR public subnet us-east-1a"
  default = "10.82.0.0/24"
}

variable "subnet_public-us-east-1b" {
  description = "CIDR public subnet us-east-1b"
  default = "10.82.1.0/24"
}

variable "ecr_name" {
  description = "ECR NAME"
  type        = list(string)
  default     = ["urbanfood/app", "urbanfood/webserver"]
}

variable "image_mutability" {
  description = "Fornecer mutabilidade de imagem"
  type        = string
  default     = "MUTABLE"
}

variable "encrypt_type" {
  description = "Tipo de criptografia utilizada na imagem"
  type        = string
  default     = "KMS"
}

variable "storage_sizes" {
  type = map
  default = {
    "1xCPU-1GB" = "25"
    "1xCPU-2GB" = "50"
    "2xCPU-4GB" = "80"
  }
}

