# Creating role for eks-master
resource "aws_iam_role" "eks-role" {
  name = "eks-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "eks.amazonaws.com"
        }
      },
    ]
  })
  tags = {
    tag-key = "eks-role"
  }
}

resource "aws_iam_role_policy_attachment" "eks-policies" {
  count    = length(var.master-policies)
  role       = aws_iam_role.eks-role.name
  policy_arn = "arn:aws:iam::aws:policy/${element(var.master-policies,count.index)}"
}

#resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
#  role       = aws_iam_role.eks-role.name
#  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
#}
#
#resource "aws_iam_role_policy_attachment" "AmazonEKSVPCResourceController" {
#  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
#  role       = aws_iam_role.eks-role.name
#}





resource "aws_iam_role" "node-role" {
  name = "node-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
  tags = {
    tag-key = "node-role"
  }
}

resource "aws_iam_role_policy_attachment" "node-policies" {
  count     = length(var.node-policies)
  policy_arn = "arn:aws:iam::aws:policy/${var.node-policies[count.index]}"
  role       = aws_iam_role.node-role.name
}

#resource "aws_iam_role_policy_attachment" "example-AmazonEKSWorkerNodePolicy" {
#  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
#  role       = aws_iam_role.node-role.name
#}
#
#resource "aws_iam_role_policy_attachment" "example-AmazonEKS_CNI_Policy" {
#  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
#  role       = aws_iam_role.node-role.name
#}
#
#resource "aws_iam_role_policy_attachment" "example-AmazonEC2ContainerRegistryReadOnly" {
#  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
#  role       = aws_iam_role.node-role.name
#}

#resource "aws_iam_role_policy_attachment" "example-AmazonEBSCSIDriverPolicy" {
#  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
#  role       = aws_iam_role.node-role.name
#}

/*
---------------------
 External DNS
--------------------- */

resource "aws_iam_role" "external-dns-role" {
  name = "external-dns-role"
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "Service": [
            "pods.eks.amazonaws.com"
          ]
        },
        "Action": [
          "sts:AssumeRole",
          "sts:TagSession"
        ]
      }
    ]
  })

  inline_policy {
    name = "external-dns-inlinepolicy"

    policy = jsonencode({
      "Version": "2012-10-17",
      "Statement": [
        {
          "Effect": "Allow",
          "Action": [
            "route53:ChangeResourceRecordSets"
          ],
          "Resource": [
            "arn:aws:route53:::hostedzone/*"
          ]
        },
        {
          "Effect": "Allow",
          "Action": [
            "route53:ListHostedZones",
            "route53:ListResourceRecordSets",
            "route53:ListTagsForResource"
          ],
          "Resource": [
            "*"
          ]
        }
      ]
    })
  }

  tags = {
    tag-key = "external-dns-role"
  }
}

