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
    us-east-1 = "ami-1924770e"
    us-west-2 = "ami-56ed4936"
    eu-west-1 = "ami-c8337dbb"
  }
}
