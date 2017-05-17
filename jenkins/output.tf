output "jenkins-ip" {
  value = "${aws_instance.jenkins-instance.public_ip}"
}
output "app-ip" {
  value = "${aws_instance.medal-app-test.public_ip}"
}
