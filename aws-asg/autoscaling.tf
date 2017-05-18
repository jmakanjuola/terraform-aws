resource "aws_launch_configuration" "demo-medal-asg-config" {
  name_prefix                 = "demo-medal-asg-config"
  image_id                    = "${lookup(var.amis, var.aws_region)}"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.jubkeypair.key_name}"
  security_groups             = ["${aws_security_group.demo-medal-instance.id}"]
}

resource "aws_autoscaling_group" "demo-medal-autoscaling" {
  name                        = "demo-medal-autoscaling"
  vpc_zone_identifier         = ["${aws_subnet.demo-medal-pub-1.id}", "${aws_subnet.demo-medal-pub-2.id}"]
  launch_configuration        = "${aws_launch_configuration.demo-medal-asg-config.name}"
  min_size                    = 1
  max_size                    = 2
  health_check_grace_period = 300
  health_check_type = "EC2"
  force_delete = true

  tag {
    key                       = "Enviroment"
    value                     = "dev-instance"
    propagate_at_launch       = true
  }
}
