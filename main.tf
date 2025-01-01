terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

terraform {
  backend "remote" {
    organization = "curso-devops-ihf"
    workspaces {
      name = "ws-pruebafinal"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "ecr" {
  source = "./modules/ecr"
}