
terraform {
  backend "s3" {
    bucket    ="demo-terraform-state-a2b621f"
    key       ="terraform/demo"
  }
}
