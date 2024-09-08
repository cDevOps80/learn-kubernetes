resource "null_resource" "get_config" {
  depends_on = [aws_eks_node_group.node-group1]
  provisioner "local-exec" {
    command = <<EOF
rm -rf ~/.kube
aws eks update-kubeconfig --name roboshop
sleep 30
EOF
  }
}