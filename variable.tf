variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}
variable "aws_default" {}

variable "AMIS" {
  type = "map"
  default = {
    eu-west-2 = "ami-036b7f67" 
    us-west-2 = "ami-fa27b39a"
    ap-northeast-1 = "ami-53624634"
 }
}
