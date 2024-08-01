variable "master-policies" {
  default = ["AmazonEKSClusterPolicy","AmazonEKSVPCResourceController"]
}

variable "node-policies" {
  default = ["AmazonEKSWorkerNodePolicy","AmazonEKS_CNI_Policy","AmazonEC2ContainerRegistryReadOnly"]
}

