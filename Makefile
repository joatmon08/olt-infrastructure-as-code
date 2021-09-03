test_setup:
	cd network && terraform plan -var-file=dev.tfvars -out=plan.tfplan
	cd network && terraform show -json plan.tfplan > plan.json