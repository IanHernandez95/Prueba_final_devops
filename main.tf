provider "aws" {
  region = "us-east-1"
  profile = "ihfterra"
}

terraform {
  backend "s3" {
    bucket = "ihf-terraform-state"
    key    = "terraform-state"
    region = "us-east-1"
    dynamodb_table = "ihf-terraform-state-lock"
    encrypt = true
    profile = "ihfterra"
  }
}

module "ecr" {
  source = "./modules/ecr"
}