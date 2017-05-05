# Admin Group
resource "aws_iam_group" "demo-abobe-stock-sre-team" {
  name = "demo-abobe-stock-sre-team"
}

resource "aws_iam_policy_attachment" "demo-abobe-stock-attach-admin" {
  name = "demo-abobe-stock-attach-admin"
  groups = ["${aws_iam_group.demo-abobe-stock-sre-team.name}"]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

# Users group

resource "aws_iam_user" "nelson" {
  name = "nelson"
}

resource "aws_iam_user" "kam" {
  name = "kam"
}

resource "aws_iam_group_membership" "sre-team" {
  name = "sre-team"
  users = [
      "${aws_iam_user.nelson.name}",
      "${aws_iam_user.kam.name}",
 ]
group = "${aws_iam_group.demo-abobe-stock-sre-team.name}"
}
