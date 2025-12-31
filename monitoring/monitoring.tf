resource "aws_autoscaling_policy" "cpu_scale_up" {
  name = "scaleops-cpu-scale-up"
  scaling_adjustment = 1
  adjustment_type = "ChangeInCapacity"
  cooldown = 60
  autoscaling_group_name = "Scaleops-asg"
}

resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name = "scaleops-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods = 2
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = 60
  statistic = "Average"
  threshold = 70

  dimensions = {
    AutoscalingGroupName = "ScaleOps-asg"
  }

  alarm_actions = [aws_autoscaling_policy.cpu_scale_up.arn]
}