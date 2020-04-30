1. Create Truss tenant
rapture wrap bridge-shared-ops aws s3api put-object --bucket bridge-truss-config-us-east-2 --key truss-demo.yaml --region us-east-2 --body deploy/tenant.yaml

2. Run Terraform
cd deploy/edge
terraform apply

curl -v 'https://truss-demo.nonprod-cmh.truss.bridgeops.sh/demo/echo?message=this%20is%20a%20demo!'

Doesn't work... wait on an alert to roll in.


## Build and push the app image

make build
rapture wrap bridge-shared-ops make push

