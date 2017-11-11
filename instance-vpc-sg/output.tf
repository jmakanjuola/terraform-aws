
output "ip" {
  value = "${aws_instance.mylab-demo.public_ip}"
}
