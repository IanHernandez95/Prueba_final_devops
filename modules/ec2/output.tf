output "InstanceId" {
  value = module.ec2.id
}

output "InstanceIP" {
  value = module.ec2.public_ip
}