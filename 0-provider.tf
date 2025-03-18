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
  region = var.aws_region
  #profile = var.aws_profile
}

terraform {
  backend "s3" {
    bucket = "iac-urbanfood-tfstates"
    key    = "terraform.tfstate"
    region = "us-east-1"
    #profile = "terraform-iac"
  }
}

