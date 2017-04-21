# Admin Group
resource "aws_iam_group" "demo-abra-admin" {
  name = "demo-abra-admin"
}

resource "aws_iam_policy_attachment" "demo-abra-attach-admin" {
  name = "demo-abra-attach-admin"
  groups = ["${aws_iam_group.demo-abra-admin.name}"]
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# Users group

resource "aws_iam_user" "operations" {
  name = "operations"
}

resource "aws_iam_user" "engineering" {
  name = "engineering"
}

resource "aws_iam_group_membership" "admin-users" {
  name = "admin-users"
  users = [
      "${aws_iam_user.operations.name}",
      "${aws_iam_user.engineering.name}",
 ]
group = "${aws_iam_group.demo-abra-admin.name}"
}
