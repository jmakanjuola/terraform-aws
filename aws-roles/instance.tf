resource "aws_instance" "demo-adobe-sre-team-test" {
    ami = "${lookup(var.amis, var.aws_region)}"
    instance_type = "t2.micro"
    count = 2

tags {
  Name = "test"
}

# Public VPC Subnet
subnet_id = "${aws_subnet.demo-adobe-sre-team-pub-1.id}"

# Security Group
vpc_security_group_ids = ["${aws_security_group.demo-adobe-sre-team-instance.id}"]

# SSH Pub Key
key_name = "${aws_key_pair.jubkeypair.key_name}"

#Role:
iam_instance_profile = "${aws_iam_instance_profile.demo-adobe-sre-team-s3-bucket-role-instanceprofile.name}"
}
