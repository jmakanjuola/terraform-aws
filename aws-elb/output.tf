output "ELB" {
  value = "${aws_elb.demo-adobe-sre-team-elb.dns_name}"
}
