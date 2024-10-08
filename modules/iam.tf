data "aws_iam_user" "user_velero" {
  user_name = var.user_name
}

resource "aws_iam_policy" "policy_user_velero" {
  name        = "${var.user_name}-policy"
  description = "Policy user Velero"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "ec2:DescribeVolumes",
          "ec2:DescribeSnapshots",
          "ec2:CreateTags",
          "ec2:CreateVolume",
          "ec2:CreateSnapshot",
          "ec2:DeleteSnapshot"
        ],
        "Resource" : "*"
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:GetObject",
          "s3:DeleteObject",
          "s3:PutObject",
          "s3:AbortMultipartUpload",
          "s3:ListMultipartUploadParts"
        ],
        "Resource" : "arn:aws:s3:::${var.bucket_name}/*"
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:ListBucket"
        ],
        "Resource" : "arn:aws:s3:::${var.bucket_name}"
      }
    ]
  })
}

# Atachando Policy ao usuário
resource "aws_iam_user_policy_attachment" "user_policy_attachment" {
  user       = var.user_name
  policy_arn = aws_iam_policy.policy_user_velero.arn
}

# Definição da política de assumir a role
resource "aws_iam_role" "role_velero" {
  name = var.user_name

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "ec2.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      },
      {
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : "arn:aws:iam::${var.account_id}:user/${var.user_name}"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
}

# Anexar a política à role
resource "aws_iam_role_policy_attachment" "role_policy_attachment" {
  role       = aws_iam_role.role_velero.name
  policy_arn = aws_iam_policy.policy_user_velero.arn
}

