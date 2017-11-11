resource "aws_security_group" "mylab-ecs-sg" {
    vpc_id ="${aws_vpc.demo-mylab.id}"
    name = "ecs"
    description = "ecs security group"
    egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
      from_port = 3000
      to_port = 3000
      protocol = "tcp"
      security_groups = ["${aws_security_group.mylab-app-elb-sg.id}"]
  }

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
    Name = "ecs"
  }
}

resource "aws_security_group" "mylab-app-elb-sg" {
  vpc_id = "${aws_vpc.demo-mylab.id}"
  name = "mylab-app-elb"
  description = "ecs security group"
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
    Name = "mylab-app-elb"
  }
}
