setup:
	cd network/dev && terraform apply -auto-approve
	cd network/prod && terraform apply -auto-approve
	cd iam && terraform apply -auto-approve

test_setup:
	cd network && terraform plan -out=plan.tfplan
	cd network && terraform show -json plan.tfplan > plan.json

clean:
	cd application/prod && terraform destroy -auto-approve
	cd application/dev && terraform destroy -auto-approve
	cd iam && terraform destroy -auto-approve
	cd network/prod && terraform destroy -auto-approve
	cd network/dev && terraform destroy -auto-approve

