output "vpc_ids" {
  description = "Map of VPC names to their IDs"
  value = {
    for k, v in aws_vpc.this : k => v.id
  }
}

output "vpc_cidr_blocks" {
  description = "Map of VPC names to their CIDR blocks"
  value = {
    for k, v in aws_vpc.this : k => v.cidr_block
  }
}

output "subnet_ids" {
  description = "Map of subnet names to their IDs"
  value = {
    for k, v in aws_subnet.this : k => v.id
  }
}

output "subnet_cidr_blocks" {
  description = "Map of subnet names to their CIDR blocks"
  value = {
    for k, v in aws_subnet.this : k => v.cidr_block
  }
}

output "public_subnet_ids" {
  description = "List of IDs for public subnets"
  value = [for k, v in aws_subnet.this : v.id if strcontains(k, "pub")]
}

output "private_subnet_ids" {
  description = "List of IDs for private subnets"
  value = [for k, v in aws_subnet.this : v.id if strcontains(k, "priv")]
}

output "route_table_ids" {
  description = "Map of subnet names to their route table IDs"
  value = {
    for k, v in aws_route_table.this : k => v.id
  }
}

output "public_subnet_ids_poland" {
  description = "List of public subnet IDs in Poland"
  value = [for k, v in aws_subnet.this : v.id if strcontains(k, "s_pol_pub")]
}

output "private_subnet_ids_poland" {
  description = "List of private subnet IDs in Poland"
  value = [for k, v in aws_subnet.this : v.id if strcontains(k, "s_pol_priv")]
}

output "public_subnet_ids_germany" {
  description = "List of public subnet IDs in Germany"
  value = [for k, v in aws_subnet.this : v.id if strcontains(k, "s_ger_pub")]
}

output "private_subnet_ids_germany" {
  description = "List of private subnet IDs in Germany"
  value = [for k, v in aws_subnet.this : v.id if strcontains(k, "s_ger_priv")]
}