terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.90.1"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  # shared_credentials_files = "˜/.aws/credentials"
  region = var.aws_region
  profile = var.aws_profile
}
