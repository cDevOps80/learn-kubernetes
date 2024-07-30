git pull

terraform init

if [ -z $1 ] ; then echo "Input is missing (plan|apply|destroy)!!" ; exit 1; fils


#if [ $1 = "plan" ]; then
#terraform plan
#else if [ $1 = "apply" ]; then
#terraform apply --auto-approve
#else [ $1 = "destroy" ]; then
#terraform destroy --auto-approve
#fi
