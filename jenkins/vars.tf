
variable "aws_access_key" {}
variable "aws_secret_key" {}
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
variable "instance_device_name" {
  default = "/dev/xvdh"
}
variable "JENKINS_VERSION" {
  default = "2.32.1"
}

variable "app_instance_count" {
  default = "0"
}

variable "app_instance_ami" {
  default = "t2.micro"
}
