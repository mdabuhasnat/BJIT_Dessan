
# ----------------
# Bastion EC2 Role
# ----------------
resource "aws_iam_role" "bastion_role" {
  name = "${var.customer_name}_${var.environment}_bastion_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "ec2.amazonaws.com"
        ]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}



# ------------------
# Bastion EC2 Policy
# ------------------
resource "aws_iam_policy" "bastion_ec2_policy" {
  name        = "${var.customer_name}_${var.environment}_bastion_ec2_policy"
#   role = "${aws_iam_role.bastion_role.name}"
  description = "${var.customer_name}_${var.environment} Bastion EC2 Policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1477071439000",
      "Effect": "Allow",
      "Action": [
        "ec2:AssociateAddress"
      ],
      "Resource": [
        "*"
      ]
    },
    {
            "Effect": "Allow",
            "Action": [
              "s3:*"
            ],
            "Resource": [
              "arn:aws:s3:::mybucket-bjit",
              "arn:aws:s3:::mybucket-bjit/*"
            ]
        }
  ]
}
EOF
}



# ---------------------------------
# Attach Bastion EC2 Policy to Role
# ---------------------------------
resource "aws_iam_role_policy_attachment" "bastion_attach_ec2_policy" {
  role       = "${aws_iam_role.bastion_role.name}"
  policy_arn = "${aws_iam_policy.bastion_ec2_policy.arn}"
}


# ---------------------------------
# Attach Bastion EC2 Instance Profile to Role
# ---------------------------------
resource "aws_iam_instance_profile" "bastion_profile" {
  name = "bastion_profile"
  role = "${aws_iam_role.bastion_role.name}"
}


