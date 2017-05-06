 Uncomment if you want to have autoscaling notifications

resource "aws_sns_topic" "demo-adobe-sre-team-sns" {
  name         = "sg-sns"
  display_name = "Demo AbobeStock-SRE Team ASG SNS topic"
}  email subscription is currently unsupported in terraform and can be done using the AWS Web Console

resource "aws_autoscaling_notification" "demo-adobe-sre-team-notify" {
  group_names = ["${aws_autoscaling_group.demo-adobe-sre-team-autoscaling.name}"]
  topic_arn     = "${aws_sns_topic.demo-adobe-sre-team-sns.arn}"
  notifications  = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR", 
  ]
}
