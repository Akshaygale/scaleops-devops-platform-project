variable "region" {
  default = "ap-south-1"
}

variable "project_name" {
  default = "Scaleops"
}

variable "environment" {
  default = "prod"
}

variable "public_subnets" {
  type = list(string)
}

variable "instance_type" {
  default = "t3.micro"  # Free Tier eligible
}

variable "ecr_url" {
  description = "ECR repository URL for the Docker image"
  type        = string
}
