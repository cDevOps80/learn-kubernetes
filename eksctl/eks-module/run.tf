resource "null_resource" "get_config" {
  provisioner "local-exec" {
    command = <<EOF
       rm -rf ~/.kube
       aws eks update-kubeconfig --name roboshop
       sleep 30
EOF
  }
}