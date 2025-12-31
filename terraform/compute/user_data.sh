#!/bin/bash
yum update -y
amazon-linux-extras install docker -y
service docker start
usermod -aG docker ec2-user

# Use Terraform variable
ECR_URL=${ecr_url}

# Login to ECR
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin $ECR_URL

# Run Docker container
docker run -d -p 80:5000 $ECR_URL:latest
