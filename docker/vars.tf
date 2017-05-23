variable "aws_region" {
  default = "us-west-2"
}
variable "aws_access_key_id" {}
variable "aws_secret_key_id" {}

variable "ecs_instance_type" {
  default = "t2.micro"
}

variable "path_to_priv_key" {
  default = "jubkey"
}
variable "path_to_pub_key" {
  default = "jubkey.pub"
}

variable "ecs_amis" {
  type = "map"
  default = {
    eu-west-1 = "ami-a8d2d7ce"
    us-west-2 = "ami-fa27b39a"
    ap-northeast-1 = "ami-afb09dc8"
  }
}
