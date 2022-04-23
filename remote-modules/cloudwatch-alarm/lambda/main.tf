resource "aws_cloudwatch_metric_alarm" "function_error" {
  alarm_name          = join("-", [var.function-name, "errors"])
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "Errors"
  namespace           = "AWS/Lambda"
  period              = "60"
  statistic           = "Maximum"
  alarm_description   = "This metric monitors function errors"
  dimensions = {
    FunctionName = var.function_name
  }
}
