variable "SNS_TOPIC_ARN" {
  description = "ARN del topic de SNS"
  type        = string
}

variable "sqs_arn" {
  description = "ARN de la cola de SQS"
  type        = string
}

variable "rol_sqs_arn" {
  description = "ARN del rol de lambda"
  type        = string

}