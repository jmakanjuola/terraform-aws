
variable "aws_access_key_id" {}
variable "aws_secret_key_id" {}
variable "aws_region" {
  default = "us-west-2"
}
variable "path_to_private_key" {
  default = "jubkey"
}
variable "path_to_public_key" {
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
variable "INSTANCE_DEVICE_NAME" {
  default = "/dev/xvdh"
}
variable "JENKINS_VERSION" {
  default = "2.32.1"
}

variable "APP_INSTANCE_COUNT" {
  default = "0"
}
