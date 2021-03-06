resource "aws_instance" "test" {
  ami = "${var.AMI_ID}"
  instance_type = "t2.micro"
  count = 2
tags {
  Name = "packer-test"
 }

subnet_id = "${aws_subnet.demo-adobe-sre-team-pub-1.id}"
key_name = "${aws_key_pair.jubkeypair.key_name}"
vpc_security_group_ids = ["${aws_security_group.demo-adobe-sre-team-instance.id}"]

}
