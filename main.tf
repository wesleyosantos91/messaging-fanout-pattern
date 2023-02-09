terraform {
  required_version = "~> 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.53.0"
    }
  }
}

provider "aws" {
  region = "sa-east-1"
  default_tags {
    tags = {
      Owner      = "wesleyosantos91"
      Managed-by = "terraform"
    }
  }
}