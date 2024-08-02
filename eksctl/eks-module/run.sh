rm -rf ~/.kube

aws eks update-kubeconfig --name roboshop

sleep 15

#kubectl apply -k "github.com/kubernetes-sigs/aws-ebs-csi-driver/deploy/kubernetes/overlays/stable/?ref=release-1.33"

