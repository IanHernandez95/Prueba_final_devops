module "ec2" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "prueba-final-ec2"

  ami = var.ami_id
  monitoring = true
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  key_name = var.key_name
  associate_public_ip_address = true

  user_data =  <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y wget unzip
              wget https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
              dpkg -i amazon-cloudwatch-agent.deb
              
              cat <<EOT > /opt/aws/amazon-cloudwatch-agent/bin/config.json
              {
                "metrics": {
                  "append_dimensions": {
                    "InstanceId": "$${aws:InstanceId}"
                  }
                }
              }
              EOT
              EOF

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}