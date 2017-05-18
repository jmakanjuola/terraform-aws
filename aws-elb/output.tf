output "ELB" {
  value = "${aws_elb.demo-medal-elb.dns_name}"
}
