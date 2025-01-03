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
    organization = "curso-devops-ihf" # Modifcar con tu nombre de organización
    workspaces {
      name = "ws-pruebafinal" # Modificar con el nombre de tu workspace
    }
  }
}

# terraform {
#   backend "s3" {
#     bucket = "curso-dev" # Modificar con el nombre de tu bucket
#     key    = "terraform/curso-devops-ihf/terraform.tfstate" # Modificar con el nombre de tu archivo
#     region = "us-east-1" # Modificar con tu región
#     dynamodb_table = "db-terraform" # Modificar con el nombre de tu tabla
#     encrypt = true
#     profile = "ihf-terraform" # Modificar con el nombre de tu profile   
#   }
# }

provider "aws" {
  region = "us-east-1"
}

module "ecr" {
  source = "./modules/ecr"
}

module "vpc-sg" {
  source     = "./modules/vpc-sg"
  cidr_block = var.cidr_block
}

module "ec2" {
  source             = "./modules/ec2"
  key_name           = var.key_name
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  subnet_id          = module.vpc-sg.public_subnets[0]
  security_group_ids = [module.vpc-sg.security_group_id]
}

module "aws_iam_role" {
  source = "./modules/iam"
}

module "sns" {
  source         = "./modules/sns"
  email_endpoint = var.sns_email
}

module "sqs" {
  source = "./modules/sqs"
}

module "lambda" {
  source        = "./modules/lambda"
  SNS_TOPIC_ARN = module.sns.sns_arn
  sqs_arn       = module.sqs.sqs_arn
  rol_sqs_arn   = module.aws_iam_role.iam_assumable_role_arn
}

module "cloudwatch" {
  source  = "./modules/cloudwatch"
  EC2_id  = module.ec2.InstanceId
  sns_arn = module.sns.sns_arn
}