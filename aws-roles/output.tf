output "instance-public-ip" {
  value = "${aws_instance.demo-abra-test.public_ip}"

output "instance-private-ip" {
  value = "${aws_instance.demo-abra-test.private_ip}"
}

output "instance-public-dns" {
  value = "${aws_instance.demo-abra-test.public_dns}"
}

output "instance-private-dns" {
  value = "${aws_instance.demo-abra-test.private_dns}"
}
