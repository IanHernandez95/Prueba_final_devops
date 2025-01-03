module "ec2" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "prueba-final-ec2"

  ami                         = var.ami_id
  monitoring                  = true
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.security_group_ids
  key_name                    = var.key_name
  associate_public_ip_address = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}