terraform {
  required_version = ">= 1.0"

  cloud {
    organization = "gtis"

    workspaces {
      tags = ["app:dynamodb-backup-restore"]
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    archive = {
      source  = "hashicorp/archive"
      version = "~> 2.4"
    }
  }
}

provider "aws" {
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
  region     = var.aws_region

  default_tags {
    tags = {
      itse_app_env      = var.itse_app_env
      itse_app_name     = var.app_name
      itse_app_customer = var.itse_app_customer
      managed_by        = "terraform"
      workspace         = terraform.workspace
    }
  }
}
