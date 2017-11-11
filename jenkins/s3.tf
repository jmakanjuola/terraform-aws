resource "aws_s3_bucket" "demo-terraform-state" {
    bucket = "demo-terraform-state-a2b621f"
    acl = "private"

    tags {
        Name = "Terraform state"
    }
}
