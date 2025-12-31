#this is for ECR url
data "template_file" "user_data" {
  template = file("${path.module}/user_data.sh") # your script path

  vars = {
    ecr_url = var.ecr_url
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "name"
    values = [ "amzn2-ami-hvm-*-x86_64-gp2" ]
  }
}

resource "aws_launch_template" "app" {
  name_prefix = "${var.project_name}-lt"
  image_id = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  tag_specifications {
    resource_type = "instance"
    tags = {
      Project= var.project_name
      Environment= var.environment
    }
  }
}

resource "aws_autoscaling_group" "app_asg" {
  desired_capacity = 2
  max_size = 4
  min_size = 2

  launch_template {
    id = aws_launch_template.app.id
    version = "$Latest"
  }

  vpc_zone_identifier = var.public_subnets

  tag {
    key = "Projetc"
    value = var.project_name
    propagate_at_launch = true
  }
}