resource "aws_security_group" "demo-abra-test" {
  vpc_id = "${aws_vpc.demo-abra.id}"
  name = "demo-hearflow-pub-sg"
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
  tags {
    Name = "demo-abra-test"
 }
}

resource "aws_security_group""mysqldb-sg" {
  vpc_id = "${aws_vpc.demo-abra.id}"
  name = "mysqldb-sg"
  description = "mysqldb access"
  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_groups = ["${aws_security_group.demo-abra-test.id}"]

}
 egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
   self = true
}

 tags {
   Name = "mysqldb-sg"   
 }
}
