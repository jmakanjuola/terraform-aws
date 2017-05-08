variable "aws_region" {}
variable "aws_access_key_id" {}
variable "aws_secret_key_id" {}
variable "db_instance_class" {}
variable "demo-adobe-sre-team-dbname" {}
variable "demo-adobe-sre-team-dbuser" {}
variable "demo-adobe-sre-team-dbpassword" {}

variable "path_to_priv_key" {
  default = "jubkey"
}
variable "path_to_pub_key" {
  default = "jubkey.pub"
}
variable "amis" {
  type = "map"
  default = {
    eu-west-1 = "ami-a8d2d7ce"
    us-west-2 = "ami-fa27b39a"
    ap-northeast-1 = "ami-afb09dc8"
 }
}
variable "rds_password" {}
