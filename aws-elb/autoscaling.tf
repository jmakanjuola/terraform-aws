resource "aws_launch_configuration" "demo-medal-asg-config" {
  name_prefix                 = "demo-medal-asg-config"
  image_id                    = "${lookup(var.amis, var.aws_region)}"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.jubkeypair.key_name}"
  security_groups             = ["${aws_security_group.demo-adobe-sre-team-elb-instance.id}"]
  user_data                   = "#!/bin/bash\napt-get -y install nginx\nMYIP=`ifconfig | grep 'addr:10' | awk '{ print $2 }' | cut -d ':' -f2`\necho 'this is: '$MYIP > /var/html/index.html"
  lifecycle                      { create_before_destroy = true }
  }

resource "aws_autoscaling_group" "demo-medal-autoscaling" {
  name                        = "demo-medal-autoscaling"
  vpc_zone_identifier         = ["${aws_subnet.demo-medal-pub-1.id}", "${aws_subnet.demo-medal-pub-2.id}"]
  launch_configuration        = "${aws_launch_configuration.demo-medal-asg-config.name}"
  min_size                    = 2
  max_size                    = 2
  health_check_grace_period   = 300
  health_check_type           = "ELB"
  load_balancers = ["${aws_elb.demo-medal-elb.name}"]
  force_delete                = true

  tag {
    key                       = "Enviroment"
    value                     = "dev-instance"
    propagate_at_launch       = true
  }
}
