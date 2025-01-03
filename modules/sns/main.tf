module "sns" {
  source = "terraform-aws-modules/sns/aws"

  name         = "prueba-final-sns"
  display_name = "prueba-final-sns"

  subscriptions = {
    email = {
      protocol = "email"
      endpoint = var.email_endpoint
    }
  }

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }

}