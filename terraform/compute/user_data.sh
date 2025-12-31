#!/bin/bash
yum update -y
amazon-linux-extras install docker -y
service docker start
usermod -aG docker ec2-user

# Injected by Terraform
ECR_URL="${ECR_URL}"

# Login to ECR
aws ecr get-login-password --region ap-south-1 \
  | docker login --username AWS --password-stdin $ECR_URL

docker pull $ECR_URL:latest

# Run Docker container
docker run -d -p 80:5000 $ECR_URL:latest
