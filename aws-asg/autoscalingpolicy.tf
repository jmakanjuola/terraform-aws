resource "aws_autoscaling_policy" "demo-medal-cpu-policy" {
    name                   = "demo-medal-cpu-policy"
    autoscaling_group_name = "${aws_autoscaling_group.demo-medal-autoscaling.name}"
    adjustment_type        = "ChangeInCapacity"
    scaling_adjustment     = "1"
    cooldown               = "120"
    policy_type            = "SimpleScaling"
}


resource "aws_cloudwatch_metric_alarm" "demo-medal-cpu-alarm" {
    alarm_name           = "demo-medal-cpu-alarm"
    alarm_description    = "demo-medal-cpu-alarm"
    comparison_operator  = "GreaterThanOrEqualToThreshold"
    evaluation_periods   = "2"
    metric_name          = "CPUUtilization"
    namespace            = "AWS/EC2"
    period               = "120"
    statistic            = "Average"
    threshold            = "30"

    dimensions = {
      "AutoScalingGroupName" = "${aws_autoscaling_group.demo-medal-autoscaling.name}"
    }

    actions_enabled  = true
    alarm_actions    = ["${aws_autoscaling_policy.demo-medal-cpu-policy.arn}"]
}


# Sclaing down alarm policy
resource "aws_autoscaling_policy" "demo-medal-cpu-policy-scaledown" {
    name                   = "demo-medal-cpu-policy-scaledown"
    autoscaling_group_name = "${aws_autoscaling_group.demo-medal-autoscaling.name}"
    adjustment_type        = "ChangeInCapacity"
    scaling_adjustment     = "-1"
    cooldown               = "120"
    policy_type            = "SimpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "demo-medal-cpu-alarm-scaledown" {
    alarm_name          = "demo-medal-cpu-alarm-scaledown"
    alarm_description   = "demo-medal-cpu-alarm-scaledown"
    comparison_operator = "LessThanOrEqualToThreshold"
    evaluation_periods  = "2"
    metric_name         = "CPUUtilization"
    namespace           = "AWS/EC2"
    period              = "120"
    statistic           = "Average"
    threshold           = "5"

    dimensions = {
      "AutoScalingGroupName" = "${aws_autoscaling_group.demo-medal-autoscaling.name}"
    }

    actions_enabled = true
    alarm_actions   = ["${aws_autoscaling_policy.demo-medal-cpu-policy-scaledown.arn}"]
}
