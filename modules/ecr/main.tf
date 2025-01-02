module "ecr" {
  source = "terraform-aws-modules/ecr/aws"

  repository_name                 = "sitioweb-static"
  repository_force_delete         = true
  repository_image_tag_mutability = "MUTABLE"

  repository_lifecycle_policy = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "Keep last 5 pushed images"
        selection = {
          tagStatus     = "tagged"
          tagPrefixList = ["v"]
          countType     = "imageCountMoreThan"
          countNumber   = 5
        }
        action = {
          type = "expire"
        }
      }
    ]
  })


  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}