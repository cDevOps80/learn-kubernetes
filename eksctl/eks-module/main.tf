resource "aws_eks_cluster" "eks" {
  name     = "roboshop"
  role_arn = aws_iam_role.eks-role.arn
  version = 1.28

  vpc_config {
    subnet_ids = ["subnet-0071e36c53f811c0b","subnet-0354194ae815795f6"]
    endpoint_private_access = false
    endpoint_public_access = true
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks-policies
  ]
}
# node-group

#resource "aws_eks_node_group" "node-group" {
#  cluster_name    = aws_eks_cluster.eks.name
#  node_group_name = "roboshop-ng"
#  node_role_arn   = aws_iam_role.node-role.arn
#  subnet_ids      = ["subnet-0071e36c53f811c0b","subnet-0354194ae815795f6","subnet-0b4d667be365dede4"]
#  capacity_type   = "SPOT"
#  disk_size       = "20"
#  instance_types  = ["t3.micro"]
#
#  scaling_config {
#    desired_size = 1
#    max_size     = 2
#    min_size     = 1
#  }
#
#  tags = {
#    Name = "roboshop-ng"
#  }
#  depends_on = [
#    aws_iam_role_policy_attachment.example-AmazonEKSWorkerNodePolicy,
#    aws_iam_role_policy_attachment.example-AmazonEKS_CNI_Policy,
#    aws_iam_role_policy_attachment.example-AmazonEC2ContainerRegistryReadOnly,
#    aws_iam_role_policy_attachment.example-AmazonEBSCSIDriverPolicy,
#  ]
#}

resource "aws_eks_node_group" "node-group1" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "roboshop-ng1"
  node_role_arn   = aws_iam_role.node-role.arn
  subnet_ids      = ["subnet-0071e36c53f811c0b","subnet-0354194ae815795f6","subnet-0b4d667be365dede4"]
  capacity_type   = "SPOT"
  disk_size       = "20"
  instance_types  = ["t3.medium"]

  scaling_config {
    desired_size = 2
    max_size     = 4
    min_size     = 1
  }

  tags = {
    Name = "roboshop-ng1"
  }
  depends_on = [
    aws_iam_role_policy_attachment.node-policies
#    aws_iam_role_policy_attachment.example-AmazonEKS_CNI_Policy,
#    aws_iam_role_policy_attachment.example-AmazonEC2ContainerRegistryReadOnly,
   #  aws_iam_role_policy_attachment.example-AmazonEBSCSIDriverPolicy,
  ]

}
