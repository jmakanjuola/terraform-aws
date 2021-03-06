resource "aws_security_group" "demo-mylab-pub-sg" {
  vpc_id = "${aws_vpc.demo-mylab.id}"
  name = "demo-mylab-pub-sg"
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
    protocol= "-1"
    cidr_blocks = ["0.0.0.0/0"]
}

tags {
  Name = "demo-mylab-sg"
 }
}
