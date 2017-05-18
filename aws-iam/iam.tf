# Admin Group
resource "aws_iam_group" "demo-medal" {
  name = "demo-medal"
}

resource "aws_iam_policy_attachment" "demo-medal-attach-admin" {
  name = "demo-medal-attach-admin"
  groups = ["${aws_iam_group.demo-medal.name}"]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

# Users group

resource "aws_iam_user" "Andy" {
  name = "Andy"
}

resource "aws_iam_user" "Daniela" {
  name = "Daniela"
}

resource "aws_iam_group_membership" "medal-team" {
  name = "medal-team"
  users = [
      "${aws_iam_user.Andy.name}",
      "${aws_iam_user.Daniela.name}",
 ]
group = "${aws_iam_group.demo-medal.name}"
}
