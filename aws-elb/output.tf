output "ELB" {
  value = "${aws_elb.demo-mylab-elb.dns_name}"
}
