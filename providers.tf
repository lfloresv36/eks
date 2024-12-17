provider "aws" {
  default_tags {
    tags = {
      Environment = "prod" # Puedes usar variables locales si ya las tienes configuradas
    }
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.67.0"
    }
  }
  required_version = ">= 1.4.2"
}
