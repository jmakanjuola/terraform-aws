# app

data "template_file" "mylab-app-task-definition-template" {
  template = "${file("templates/mylab-app.json.tpl")}"
  vars {
    REPOSITORY_URL = "${replace("${aws_ecr_repository.mylab-app.repository_url}", "https://", "")}"
  }
}

resource "aws_ecs_task_definition" "mylab-app-task-definition" {
  family                = "mylab-app"
  container_definitions = "${data.template_file.mylab-app-task-definition-template.rendered}"
}

resource "aws_elb" "mylab-app-elb" {
  name = "mylab-app-elb"

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

  subnets = ["${aws_subnet.demo-mylab-pub-1.id}","${aws_subnet.demo-mylab-pub-2.id}"]
  security_groups = ["${aws_security_group.mylab-app-elb-sg.id}"]

  tags {
    Name = "mylab-app-elb"
  }
}

resource "aws_ecs_service" "mylab-app-service" {
  name = "mylab-app"
  cluster = "${aws_ecs_cluster.mylab-cluster.id}"
  task_definition = "${aws_ecs_task_definition.mylab-app-task-definition.arn}"
  desired_count = 1
  iam_role = "${aws_iam_role.mylab-ecs-service-role.arn}"
  depends_on = ["aws_iam_policy_attachment.mylab-ecs-service-attach"]

  load_balancer {
    elb_name = "${aws_elb.mylab-app-elb.name}"
    container_name = "mylab-app"
    container_port = 3000
  }
  lifecycle { ignore_changes = ["task_definition"] }
}
