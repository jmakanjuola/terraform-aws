output "instance" {
  value = "${aws_instance.demo-adobe-sre-team-test.public_ip}"
}
output "rds"{
  value = "${aws_db_instance.mysqldb.endpoint}"
}
