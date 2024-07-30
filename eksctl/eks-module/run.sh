git pull

# terraform init

if [ -z $1 ] ; then echo "Input is missing (plan|apply|destroy)!!" ; exit 1; fi


if [ $1 = "plan" ]; then
echo terraform plan
else if [ $1 = "apply" ]; then
echo terraform apply --auto-approve
else [ $1 = "destroy" ]
echo terraform destroy --auto-approve
fi
