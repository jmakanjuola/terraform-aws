output "instance-public-ip" {
  value = "${aws_instance.demo-adobe-sre-team-test.public_ip}"
