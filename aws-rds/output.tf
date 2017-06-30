output "instance" {

  value = "${aws_instance.demo-mylab-test.public_ip}"
}
output "rds"{
  value = "${aws_db_instance.mysqldb.endpoint}"
}
