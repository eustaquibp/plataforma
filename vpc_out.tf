#vpc out
output "vpc_id" {
  description = "The vpc is"
  value       = module.vpc.vpc_id
}

output "vpc_arn" {
  description = "The vpc arn"
  value       = module.vpc.vpc_arn
}

output "vpc_dhcp" {
  description = "The vpc cidr_block"
  value       = module.vpc.vpc_cidr_block
}

output "out_vpc_cidr_block" {
  description = "The vpc cidr_block"
  value       = module.vpc.vpc_cidr_block
}

# Subnets
output "availability_zones" {
  description = "The availability zones used"
  value       = module.vpc.availability_zones
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

output "private_subnets_cidr_blocks" {
  description = "List of IPs of private subnets"
  value       = module.vpc.private_subnets_cidr_blocks
}

output "private_subnets_list" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets_list
}

output "private_subnets_azs" {
  description = "List of cidr_blocks of private subnets"
  value       = module.vpc.private_subnets_azs
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

output "public_subnets_cidr_blocks" {
  description = "List of IPs of public subnets"
  value       = module.vpc.public_subnets_cidr_blocks
}

output "public_subnets_list" {
  description = "List of IDs of private subnets"
  value       = module.vpc.public_subnets_list
}

output "public_subnets_azs" {
  description = "List of cidr_blocks of public subnets"
  value       = module.vpc.public_subnets_azs
}

output "database_subnets" {
  description = "List of IDs of database subnets"
  value       = module.vpc.database_subnets
}

output "database_subnets_cidr_blocks" {
  description = "List of IPs of database subnets"
  value       = module.vpc.database_subnets_cidr_blocks
}

output "database_subnets_list" {
  description = "List of IDs of database subnets"
  value       = module.vpc.database_subnets_list
}

output "database_subnets_azs" {
  description = "List of cidr_blocks of database subnets"
  value       = module.vpc.database_subnets_azs
}

output "database_subnet_group" {
  description = "ID of database subnet group"
  value       = module.vpc.database_subnet_group
}

# Route tables
output "public_route_table_ids" {
  description = "List of IDs of public route tables"
  value       = module.vpc.public_route_table_ids
}

output "private_route_table_ids" {
  description = "List of IDs of private route tables"
  value       = module.vpc.private_route_table_ids
}

output "nat_ids" {
  description = "List of allocation ID of Elastic IPs created for AWS NAT Gateway"
  value       = module.vpc.nat_ids
}

output "nat_public_ips" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value       = module.vpc.nat_public_ips
}

output "natgw_ids" {
  description = "List of NAT Gateway IDs"
  value       = module.vpc.natgw_ids
}

# Internet Gateway
output "igw_id" {
  description = "The ID of the Internet Gateway"
  value       = module.vpc.igw_id
}

output "vgw_id" {
  description = "The ID of the VGW"
  value       = module.vpc.vgw_id
}

