
resource "aws_security_group" "demo-medal-instance" {
  vpc_id = "${aws_vpc.demo-medal.id}"
  name = "demo-medal-elb-sg"
  description = "Allows ssh ingress & egress traffic"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
 }


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
   security_groups = ["${aws_security_group.demo-medal-elb-sg.id}"]
 }
 tags {
   Name = "demo-medal-elb-instance"
  }
}
resource "aws_security_group" "demo-medal-elb-sg" {
  vpc_id = "${aws_vpc.demo-medal.id}"
  name = "ELB"
  description = "ELB security group"
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
    Name = "ELB"
  }
}
