
output "instance" {
  value = "${aws_instance.demo-medal-test.public_ip}"
}

output "instance-private-ip" {
  value = "${aws_instance.demo-medal-test.private_ip}"
}

output "instance-public-dns" {
  value = "${aws_instance.demo-medal-test.public_dns}"
}

output "instance-private-dns" {
  value = "${aws_instance.demo-medal-test.private_dns}"
}
