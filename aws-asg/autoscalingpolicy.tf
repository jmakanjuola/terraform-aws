resource "aws_autoscaling_policy" "demo-adobe-sre-team-cpu-policy" {
    name                          = "demo-adobe-sre-team-cpu-policy"
    autoscaling_group_name        = "${aws_autoscaling_group.demo-adobe-sre-team-autoscaling.name}"
    adjustment_type               = "ChangeInCapacity"
    scaling_adjustment            = "1"
    cooldown                      = "300"
    policy_type                   = "SimpleScaling"
}


resource "aws_cloudwatch_metric_alarm" "demo-adobe-sre-team-cpu-alarm" {
    alarm_name                    = "demo-adobe-sre-team-cpu-alarm"
    alarm_description             = "This metric monitor ec2 cpu utilization for Adobe SRE Team manages"
    comparison_operator           = "GreaterThanOrEqualToThreshold"
    evaluation_periods            = "2"
    metric_name                   = "CPUUtilization"
    namespace                     = "AWS/EC2"
    period                        = "120"
    statistic                     = "Average"
    threshold                     = "30"

    dimensions = {
      "AutoScalingGroupName"      = "${aws_autoscaling_group.demo-adobe-sre-team-autoscaling.name}"
    }

    actions_enabled               = true
    alarm_actions                 = ["${aws_autoscaling_policy.demo-adobe-sre-team-cpu-policy.arn}"]
}


# Sclaing down alarm policy
resource "aws_autoscaling_policy" "demo-adobe-sre-team-cpu-policy-scaledown" {
    name                          = "demo-adobe-sre-team-cpu-policy-scaledown"
    autoscaling_group_name        = "${aws_autoscaling_group.demo-adobe-sre-team-autoscaling.name}"
    adjustment_type               = "ChangeInCapacity"
    scaling_adjustment            = "-1"
    cooldown                      = "300"
    policy_type                   = "SimpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "demo-adobe-sre-team-cpu-alarm-scaledown" {
    alarm_name                    = "demo-adobe-sre-team-cpu-alarm"
    alarm_description             = "This metric monitor ec2 cpu utilization policy for scaling down managed by Adobe SRE Team manages"
    comparison_operator           = "LessThanOrEqualToThreshold"
    evaluation_periods            = "2"
    metric_name                   = "CPUUtilization"
    namespace                     = "AWS/EC2"
    period                        = "120"
    statistic                     = "Average"
    threshold                     = "5"

    dimensions = {
      "AutoScalingGroupName"      = "${aws_autoscaling_group.demo-adobe-sre-team-autoscaling.name}"
    }


    actions_enabled               = true
    alarm_actions                 = ["${aws_autoscaling_policy.demo-adobe-sre-team-cpu-policy.arn}"]
}
