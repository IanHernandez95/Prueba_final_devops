module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "vpc-prueba-final"
  cidr = var.cidr_block

  azs             = ["us-east-1a"]
  public_subnets  = ["192.168.1.0/24"]
  private_subnets = ["192.168.2.0/24"]

  enable_nat_gateway = false

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "security_group" {
  source = "terraform-aws-modules/security-group/aws"

  name = "prueba-final-sg"
  description = "Grupo de seguridad creado para la prueba final devops"
  vpc_id = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "SSH"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "HTTP"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      description = "HTTPS"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      description = "All traffic"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}