variable "ami_id" {
  description = "The AMI to use for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to launch"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID to launch the instance in"
  type        = string
}

variable "security_group_ids" {
  description = "The security group IDs to use for the EC2 instance"
  type        = list(string)
}

variable "key_name" {
  description = "The key name to use for the EC2 instance"
  type        = string
}