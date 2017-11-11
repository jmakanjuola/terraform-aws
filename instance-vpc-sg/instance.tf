resource "aws_instance" "mylab-demo" {
  ami = "${lookup(var.amis, var.aws_region)}"
  instance_type = "t2.micro"
  count = 6
tags {
  Name = "mylab-demo"
 }

subnet_id = "${aws_subnet.demo-mylab-pub-1.id}"
key_name = "${aws_key_pair.jubkeypair.key_name}"
vpc_security_group_ids = ["${aws_security_group.demo-mylab-pub-sg.id}"]

}
