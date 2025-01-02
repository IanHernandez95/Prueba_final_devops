output "ecr_repository_url" {
  value = module.ecr.this_repository_url
  description = "The URL of the ECR repository"
}