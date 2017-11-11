resource "aws_key_pair" "jubkeypair" {
  key_name = "jubkeypair"
  public_key = "${file("${var.path_to_public_key}")}"
  lifecycle {
    ignore_changes = ["public_key"]
  }
}
