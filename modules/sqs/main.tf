module "sqs" {
  source = "terraform-aws-modules/sqs/aws"

  name = "sqs-prueba-final"
  
  tags = {
    Name = "sqs-prueba-final"
    terraform = "true"
    Environment = "dev"
  }
}