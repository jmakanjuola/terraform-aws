resource "aws_launch_configuration" "demo-adobe-sre-team-asg-config" {
  name_prefix                 = "demo-adobe-sre-team-asg-config"
  image_id                    = "${lookup(var.amis, var.aws_region)}"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.jubkeypair.key_name}"
  security_groups             = ["${aws_security_group.demo-adobe-sre-team-elb-sg.id}"]
}

resource "aws_autoscaling_group" "demo-adobe-sre-team-autoscaling" {
  name                        = "demo-adobe-sre-team-autoscaling"
  vpc_zone_identifier         = ["${aws_subnet.demo-adobe-sre-team-pub-1.id}", "${aws_subnet.demo-adobe-sre-team-pub-2.id}"]
  launch_configuration        = "${aws_launch_configuration.demo-adobe-sre-team-asg-config.name}"
  min_size                    = 2
  max_size                    = 2
  health_check_grace_period   = 300
  health_check_type           = "ELB"
  load_balancers = ["${aws_elb.demo-adobe-sre-team-elb.name}"]
  force_delete                = true

  tag {
    key                       = "Name"
    value                     = "ec2 instance"
    propagate_at_launch       = true
  }
}
