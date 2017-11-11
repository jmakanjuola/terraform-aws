resource "aws_iam_group" "mylab-admin" {
    name = "mylab-admin"
}

resource "aws_iam_policy_attachment" "mylab-attach-admin-access" {
  name = "mylab-attach-admin-access"
  groups = ["${aws_iam_group.mylab-admin.name}"]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

# Users with Admin access to mylab AWS account

 resource "aws_iam_user" "kops" {
   name = "kops"
 }

 resource "aws_iam_user" "mylab" {
   name = "mylab"
}

 resource "aws_iam_user" "John" {
     name = "John"
}

resource "aws_iam_group_membership" "mylab-admin-team" {
   name = "mylab-admin-team"
   users = [
     "${aws_iam_user.kops.name}",
     "${aws_iam_user.Peter.name}",
     "${aws_iam_user.John.name}",
   ]
group = "${aws_iam_group.mylab-admin.name}"
}

# mylab Developers
resource "aws_iam_group" "mylab-developers" {
    name = "mylab-developers"
}

resource "aws_iam_policy_attachment" "mylab-attach-developer-access" {
  name = "mylab-attach-admin-access"
  groups = ["${aws_iam_group.mylab-developers.name}"]
  policy_arn = "arn:aws:iam::aws:policy/AWSLambdaFullAccess"
}

# Developers Users with Lambda access

 resource "aws_iam_user" "James" {
   name = "James"
 }

 resource "aws_iam_user" "Peter" {
   name = "Peter"
}

 resource "aws_iam_user" "Tim" {
     name = "Tim"
}

resource "aws_iam_group_membership" "mylab-developers-team" {
   name = "mylab-admin-team"
   users = [
     "${aws_iam_user.Peter.name}",
     "${aws_iam_user.James.name}",
     "${aws_iam_user.Tim.name}",
   ]
group = "${aws_iam_group.mylab-developers.name}"
}
