output "ecr_repository_url" {
  value       = module.ecr.this_repository_url
  description = "The URL of the ECR repository"
}

output "public_subnets" {
  value       = module.vpc-sg.public_subnets
  description = "The public subnets of the VPC"  
}

output "security_group_id" {
  value       = module.vpc-sg.security_group_id
  description = "The ID of the security group"  
  
}

output "instance_id" {
  value       = module.ec2.InstanceId
  description = "The ID of the EC2 instance" 
}

output "InstanceIP" {
  value = module.ec2.InstanceIP
}

output "sns_arn" {
  value       = module.sns.sns_arn
  description = "The ARN of the SNS topic"  
}

output "sqs_arn" {
  value       = module.sqs.sqs_arn
  description = "The ARN of the SQS queue"  
  
}


output "iam_assumable_role_ARN" {
  value       = module.aws_iam_role.iam_assumable_role_arn
  description = "The ARN of the IAM role"
  
}