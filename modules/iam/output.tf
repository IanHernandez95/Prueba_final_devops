output "iam_assumable_role_arn" {
  description = "The ARN of the IAM role"
  value       = module.iam_assumable_role.iam_role_arn
}