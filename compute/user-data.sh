#!/bin/bash
yum update -y
amazon-linux-extras install docker -y
service docker start
usermod -aG docker ec2-user

aws ecr get-login-password --region ap-south-1 | \
docker login --username AWS --password-stdin aws_ecr_repository.app_repo.repository_url

docker run -d -p 80:80 aws_ecr_repository.app_repo.repository_url:latest
