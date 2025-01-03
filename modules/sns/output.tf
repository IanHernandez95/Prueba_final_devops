output "sns_arn" {
  value       = module.sns.topic_arn
  description = "The ARN of the SNS topic"
}