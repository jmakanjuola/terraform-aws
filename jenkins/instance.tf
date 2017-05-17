resource "aws_instance" "jenkins-instance" {
  ami           = "${lookup(var.amis, var.aws_region)}"
  instance_type = "t2.small"
  tags {
    Name = "jenkins-instance"
   }

  # the VPC subnet
  subnet_id = "${aws_subnet.demo-medal-pub-1.id}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.demo-medal-instance.id}"]

  # the public SSH key
  key_name = "${aws_key_pair.jubkeypair.key_name}"

  # user data
  user_data = "${data.template_cloudinit_config.cloudinit-jenkins.rendered}"

}

resource "aws_ebs_volume" "jenkins-data" {
    availability_zone = "us-west-2a"
    size = 20
    type = "gp2"
    tags {
        Name = "jenkins-data"
    }
}

resource "aws_volume_attachment" "jenkins-data-attachment" {
  device_name = "${var.instance_device_name}"
  volume_id = "${aws_ebs_volume.jenkins-data.id}"
  instance_id = "${aws_instance.jenkins-instance.id}"
}

resource "aws_instance" "app-instance" {
  count = "${var.app_instance_count}" 
  ami = "${var.app_instance_ami}"
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = "${aws_subnet.demo-medal-pub-1.id}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.medal-app-sg.id}"]

  # the public SSH key
  key_name = "${aws_key_pair.jubkeypair.key_name}"
}
