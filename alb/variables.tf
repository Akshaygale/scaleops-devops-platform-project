variable "region" {
  default = "ap-south-1"
}

variable "project_name" {
  default = "Scaleops"
}

variable "environment" {
  default = "prod"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID from networking module"
}

variable "public_subnets" {
  type        = list(string)
  description = "List of public subnet IDs"
}
