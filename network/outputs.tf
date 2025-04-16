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
  value = [for k, v in aws_subnet.this : v.id if contains(k, "pub")]
}

output "private_subnet_ids" {
  description = "List of IDs for private subnets"
  value = [for k, v in aws_subnet.this : v.id if contains(k, "priv")]
}

output "route_table_ids" {
  description = "Map of subnet names to their route table IDs"
  value = {
    for k, v in aws_route_table.this : k => v.id
  }
}