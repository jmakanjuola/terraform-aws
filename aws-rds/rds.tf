 resource "aws_db_subnet_group" "demo-medal-mysql-subnet" {
   name = "demo-medal-mysql-subnet"
   description = "Mysql database subnet group"
   subnet_ids = ["${aws_subnet.demo-medal-priv-1.id}","${aws_subnet.demo-medal-priv-2.id}"]
}

resource "aws_db_parameter_group" "mysqldb-parameters" {
  name = "mysqldb-parameters"
  family = "mysql5.7"
  description = "Mysql database parameter group"


   parameter {
    name  = "character_set_server"
    value = "utf8"
  }

  parameter {
    name  = "character_set_client"
    value = "utf8"
  }
 }



resource "aws_db_instance" "mysqldb" {
  allocated_storage	  = 100
  engine		  = "mysql"
  engine_version	  = "5.7"
  identifier              = "mysqldb"
  instance_class	  = "${var.db_instance_class}"
  name			  = "${var.demo-medal-dbname}"
  username		  = "${var.demo-medal-dbuser}"
  password		  = "${var.demo-medal-dbpassword}"
  db_subnet_group_name    = "${aws_db_subnet_group.demo-medal-mysql-subnet.name}"
  parameter_group_name    = "mysqldb-parameters"
  vpc_security_group_ids  = ["${aws_security_group.mysqldb-sg.id}"]
  multi_az                = "false"     # set to false for now. But set to true for high availability: End Goal: sync instances with each other
  storage_type            = "gp2"
  backup_retention_period = 30    # backups during period
  availability_zone       = "${aws_subnet.demo-medal-priv-1.availability_zone}"   # prefered AZ

}
