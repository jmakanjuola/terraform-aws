provider "aws" {
  access_key = "${var.aws_access_key_id}"
  secret_key = "${var.aws_secret_key_id}"
  region = "${var.aws_region}"
}
