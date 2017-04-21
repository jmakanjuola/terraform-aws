output "instance" {
  value = "${aws_instance.demo-abra-test.public_ip}"
}
output "rds"{
  value = "${aws_db_instance.mysqldb.endpoint}"
}
