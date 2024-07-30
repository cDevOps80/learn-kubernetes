git pull

terraform init

if [ $1 -eq 0 ] ; then echo "Input is missing (plan|apply|destroy)!!" ; exit 1; fi

if [ $1 = "plan" ]; then
terraform plan
else if [ $1 = "apply" ]; then
terraform apply --auto-approve
else [ $1 = "destroy" ]; then
terraform destroy --auto-approve
fi
