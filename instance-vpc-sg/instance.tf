resource "aws_instance" "medal-demo" {
  ami = "${lookup(var.amis, var.aws_region)}"
  instance_type = "t2.micro"
tags {
  Name = "medal-demo"
 }

subnet_id = "${aws_subnet.demo-medal-pub-1.id}"
key_name = "${aws_key_pair.jubkeypair.key_name}"
vpc_security_group_ids = ["${aws_security_group.demo-medal-pub-sg.id}"]

}
