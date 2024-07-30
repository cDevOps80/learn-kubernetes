resource "aws_eks_cluster" "example" {
  name     = "roboshop"
  role_arn = aws_iam_role.eks-role.arn
  version = 1.28

  vpc_config {
    subnet_ids = ["subnet-0071e36c53f811c0b","subnet-0354194ae815795f6"]
    endpoint_private_access = false
    endpoint_public_access = true
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEKSVPCResourceController
  ]
}