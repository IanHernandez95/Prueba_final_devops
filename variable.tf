variable "cidr_block" {
  description = "value of the CIDR block"
  type        = string
}

variable "ami_id" {
  description = "value of the AMI ID"
  type = string
}

variable "instance_type" {
  description = "value of the instance type"
  type = string  
}

variable "key_name" {
  description = "value of the key name"
  type = string
}

variable "sns_email" {
  description = "value of the SNS email"
  type = string  
}