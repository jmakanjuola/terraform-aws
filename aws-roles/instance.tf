resource "aws_instance" "demo-abra-test" {
    ami = "${lookup(var.amis, var.aws_region)}"
    instance_type = "t2.micro"


# Public VPC Subnet
subnet_id = "${aws_subnet.demo-abra-pub-1.id}"

# Security Group
vpc_security_group_ids = ["${aws_security_group.demo-abra-instance.id}"]

# SSH Pub Key
key_name = "${aws_key_pair.jubkeypair.key_name}"

#Role:
iam_instance_profile = "${aws_iam_instance_profile.demo-abra-s3-bucket-role-instanceprofile.name}"
}
