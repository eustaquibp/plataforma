#!/bin/bash

if [ $# -eq 0 ]
then
        echo
        echo "Favor informar um ambiente como argumento."
        echo $0" <DEV | HML | PRD | MGR | FIX | ACT>"
        echo
        exit 1
fi

ambiente=$1
AMBIENTE=${ambiente^^}

rm -rf .terraform

terraform init -backend=true -backend-config="key=ADQ/conta-$AMBIENTE/infra-core-adq-wkl-msv.tfstate"
terraform plan -var-file=tfvars/$AMBIENTE".tfvars"
