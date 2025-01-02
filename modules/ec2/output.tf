output "InstanceId" {
  value = module.ec2.id
}

output "InstaceIP" {
  value = module.ec2.public_ip
}