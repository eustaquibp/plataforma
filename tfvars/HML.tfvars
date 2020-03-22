##################################################################################
# RESOURCE GERAL
environment     	 = "HML"
iac             	 = "Terraform"
project  	         = "CovidZero"
aws_region               = "sa-east-1"

#################################################################################
#RESOURCE VPC
name-vpc                 = "VPC-HML-CovidZero"
cidr_block               = "10.110.0.0/21"
dhcp_options_domain_name = "hml-priv.covidzero.com.br"
dhcp_name_servers        = "10.112.112.2"
enable_nat_gateway       = "true"
single_nat_gateway	 = "true"
one_nat_gateway_per_az	 = "false"
enable_vpn_gateway	 = "false"

################################################################################
#RESOURCE PEERING

