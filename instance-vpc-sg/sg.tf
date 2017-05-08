resource "aws_security_group" "demo-adobe-sre-team-pub-sg" {
  vpc_id = "${aws_vpc.demo-adobe-sre-team.id}"
  name = "demo-adobe-sre-team-pub-sg"
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
  Name = "demo-adobe-sre-team-sg"
 }
}
