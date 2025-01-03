terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
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

provider "" {
  region = "us-east-1"
}