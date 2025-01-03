module "cloudwatch_alarm_cpu" {
  source = "terraform-aws-modules/cloudwatch/aws//modules/metric-alarm"

  alarm_name          = "Mas de 80% de uso de CPU"
  alarm_description   = "Uso de CPU mayor a un 80 porciento"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  threshold           = 80
  period              = 180
  unit                = "Percent"

  namespace   = "AWS/EC2"
  metric_name = "CPUUtilization"
  statistic   = "Maximum"

  dimensions = {
    InstanceId = var.EC2_id
  }

  alarm_actions = [var.sns_arn]
}

module "cloudwatch_status_check_Failed" {
  source = "terraform-aws-modules/cloudwatch/aws//modules/metric-alarm"

  alarm_name          = "Status Check Failed"
  alarm_description   = "Status Check Failed"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  threshold           = 1
  period              = 60
  unit                = "Count"

  namespace   = "AWS/EC2"
  metric_name = "StatusCheckFailed"
  statistic   = "Maximum"

  dimensions = {
    InstanceId = var.EC2_id
  }

  alarm_actions = [var.sns_arn]

}
