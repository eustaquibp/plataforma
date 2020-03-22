module "vpc" {
source = "git::https://nneyf2wrzavcq4bx5mymzs7vfw4pvijqe3vwzdrfhryfv6x6ftaq@alelo.visualstudio.com/DefaultCollection/Adquirencia/_git/terraform-module-aws-vpc?ref=v1.0"

  name = var.name-vpc

  cidr = var.cidr_block

  azs              = ["sa-east-1a", "sa-east-1c"]
  public_subnets   = [cidrsubnet(var.cidr_block, 3, 0), cidrsubnet(var.cidr_block, 3, 1)]
  private_subnets  = [cidrsubnet(var.cidr_block, 3, 2), cidrsubnet(var.cidr_block, 3, 3)]
  database_subnets = [cidrsubnet(var.cidr_block, 3, 4), cidrsubnet(var.cidr_block, 3, 5)]

  enable_dhcp_options = true
  dhcp_options_domain_name         = var.dhcp_options_domain_name
  dhcp_options_domain_name_servers = [
					var.dhcp_name_servers,
					"8.8.8.8"
				     ]
  
  create_database_subnet_group = true

  propagate_private_route_tables_vgw = true
  propagate_public_route_tables_vgw = true

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway
  enable_vpn_gateway = var.enable_vpn_gateway
  one_nat_gateway_per_az = var.one_nat_gateway_per_az
  tags = {
    Ambiente = var.environment
    Projeto  = var.project
    IaC      = var.iac
  }
}

resource "aws_dx_gateway_association" "dx_gateway" {
  dx_gateway_id         = data.terraform_remote_state.dx.outputs.dxgw_id
  associated_gateway_id = module.vpc.vgw_id
}
