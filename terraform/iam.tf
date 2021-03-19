resource "aws_iam_role" "jenkins-s3-role" {
  name = "jenkins-s3-role"

  assume_role_policy = <<EOF
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

resource "aws_iam_instance_profile" "jenkins-s3-role" {
  name = "jenkins-s3-role"
  role = "${aws_iam_role.jenkins-s3-role.name}"
}

resource "aws_iam_role_policy" "jenkins-s3-policy" {
  name = "jenkins-s3-policy"
  role = "${aws_iam_role.jenkins-s3-role.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Resource": [
          "arn:aws:s3:::put-your-bucket-name-here",
          "arn:aws:s3:::put-your-bucket-name-here/*"
      ],
      "Effect": "Allow"
    }
  ]
}
EOF
}