resource "aws_s3_bucket" "demo-bucket" {
  bucket = "jubilee-bucket-c29f1"
  acl = "private"

  tags {
    Name = "jubilee-bucket-c29f1"
  }
}
