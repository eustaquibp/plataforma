#!/bin/bash

if [ $# -eq 0 ]
then
	echo
	echo "Favor informar um ambiente como argumento."
	echo $0" <DEV | HOM | PRD | MGR>"
	echo
	exit 1
fi

ambiente=$1
AMBIENTE=${ambiente^^}

rm -rf .terraform

terraform init -backend=true -backend-config="key=ADQ/conta-$AMBIENTE/heimdall-wkl-adq-shared-transvv-tf"
terraform plan -var-file=tfvars/$AMBIENTE".tfvars"
