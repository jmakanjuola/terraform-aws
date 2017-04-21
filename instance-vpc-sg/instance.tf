resource "aws_instance" "test" {  
  ami = "${lookup(var.amis, var.aws_region)}"
  instance_type = "t2.micro"
  
tags {
  Name = "test"
 } 

subnet_id = "${aws_subnet.demo-abra-pub-1.id}"
key_name = "${aws_key_pair.jubkeypair.key_name}"
vpc_security_group_ids = ["${aws_security_group.demo-abra-pub-sg.id}"]

}

