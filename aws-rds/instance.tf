
resource "aws_instance" "demo-mylab-test" {
   ami = "${lookup(var.amis, var.aws_region)}"
   instance_type = "t2.micro"

   # Public vpc subnet
   subnet_id = "${aws_subnet.demo-mylab-pub-1.id}"

  # Security Group
   vpc_security_group_ids = ["${aws_security_group.demo-mylab-test.id}"]

  # SSH pub key
   key_name = "${aws_key_pair.jubkeypair.key_name}"
}
