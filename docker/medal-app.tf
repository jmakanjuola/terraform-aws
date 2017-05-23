# app

data "template_file" "medal-app-task-definition-template" {
  template = "${file("templates/medal-app.json.tpl")}"
  vars {
    REPOSITORY_URL = "${replace("${aws_ecr_repository.medal-app.repository_url}", "https://", "")}"
  }
}

resource "aws_ecs_task_definition" "medal-app-task-definition" {
  family                = "medal-app"
  container_definitions = "${data.template_file.medal-app-task-definition-template.rendered}"
}

resource "aws_elb" "medal-app-elb" {
  name = "medal-app-elb"

  listener {
    instance_port = 3000
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }

  health_check {
    healthy_threshold = 3
    unhealthy_threshold = 3
    timeout = 30
    target = "HTTP:3000/"
    interval = 60
  }

  cross_zone_load_balancing = true
  idle_timeout = 400
  connection_draining = true
  connection_draining_timeout = 400

  subnets = ["${aws_subnet.demo-medal-pub-1.id}","${aws_subnet.demo-medal-pub-2.id}"]
  security_groups = ["${aws_security_group.medal-app-elb-sg.id}"]

  tags {
    Name = "medal-app-elb"
  }
}

resource "aws_ecs_service" "medal-app-service" {
  name = "medal-app"
  cluster = "${aws_ecs_cluster.medal-cluster.id}"
  task_definition = "${aws_ecs_task_definition.medal-app-task-definition.arn}"
  desired_count = 1
  iam_role = "${aws_iam_role.medal-ecs-service-role.arn}"
  depends_on = ["aws_iam_policy_attachment.medal-ecs-service-attach"]

  load_balancer {
    elb_name = "${aws_elb.medal-app-elb.name}"
    container_name = "medal-app"
    container_port = 3000
  }
  lifecycle { ignore_changes = ["task_definition"] }
}
