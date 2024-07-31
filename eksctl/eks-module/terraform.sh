git pull

terraform init

if [ -z $1 ] ; then echo "Input is missing (plan|apply|destroy)!!" ; exit 1; fi

if [ $1 = "plan" ]; then
 terraform plan
elif [ $1 = "apply" ]; then
 terraform apply --auto-approve
else [ $1 = "destroy" ]
 terraform destroy --auto-approve
fi
