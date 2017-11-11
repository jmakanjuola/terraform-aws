resource "aws_iam_role" "demo-mylab-s3-bucket-role" {
    name = "demo-mylab-s3-bucket-role"
    assume_role_policy =<<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "demo-mylab-s3-bucket-role-instanceprofile" {
    name = "demo-mylab-s3-bucket-role"
    roles = ["${aws_iam_role.demo-mylab-s3-bucket-role.name}"]
}

resource "aws_iam_role_policy" "demo-mylab-s3-bucket-role-policy" {
    name = "demo-mylab-s3-bucket-role-policy"
    role = "${aws_iam_role.demo-mylab-s3-bucket-role.id}"
    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
              "s3:*"
            ],
            "Resource": [
              "arn:aws:s3:::jubilee-bucket-c29f1",
              "arn:aws:s3:::jubilee-bucket-c29f1/*"
            ]
        }
    ]
}
EOF
}
