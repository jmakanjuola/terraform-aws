resource "aws_ecs_cluster" "medal-cluster" {
  name = "medal-cluster"
}
resource "aws_launch_configuration" "medal-ecs-config" {
  name_prefix = "medal-ecs-config"
  image_id = "${lookup(var.ecs_amis, var.aws_region)}"
  instance_type = "${var.ecs_instance_type}"
  key_name = "${aws_key_pair.jubkeypair.key_name}"
  iam_instance_profile = "${aws_iam_instance_profile.medal-ecs-ec2-role.id}"
  security_groups = ["${aws_security_group.medal-ecs-sg.id}"]
  user_data = "#!/bin/bash\necho 'ecs_cluster=medal-cluster' > /etc/ecs/ecs.config\nstart ecs"
  lifecycle    { create_before_destroy = true}
}

resource "aws_autoscaling_group" "medal-ecs-asg" {
  name = "medal-ecs-asg"
  vpc_zone_identifier = ["${aws_subnet.demo-medal-pub-1.id}", "${aws_subnet.demo-medal-pub-2.id}"]
  launch_configuration = "${aws_launch_configuration.medal-ecs-config.name}"
  min_size = 1
  max_size = 1
  tag {
    key ="Development"
    value = "ecs-ec2-container"
    propagate_at_launch = true
  }
}
