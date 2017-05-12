resource "aws_elb" "demo-adobe-sre-team-elb" {
    name = "demo-adobe-sre-team-elb"
		subnets = ["${aws_subnet.demo-adobe-sre-team-pub-1.id}", "${aws_subnet.demo-adobe-sre-team-pub-2.id}"]
		security_groups = ["${aws_security_group.demo-adobe-sre-team-elb-sg.id }"]
	listener {
	  instance_port = 80
	  instance_protocol = "http"
	  lb_port = 80
	  lb_protocol = "http"
	}
	health_check {
	  healthy_threshold = 2
	  unhealthy_threshold = 2
	  timeout = 3
	  target = "HTTP:80/"
	  interval = 30
	}

	cross_zone_load_balancing = true
	connection_draining = true
	connection_draining_timeout =400
	tags{
		Name = "demo-adobe-sre-team-elb"
	}
}
