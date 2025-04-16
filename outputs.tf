output "vpc_ids" {
  description = "Map of VPC names to their IDs (from network module)"
  value       = module.network.vpc_ids
}

output "vpc_cidr_blocks" {
  description = "Map of VPC names to their CIDR blocks (from network module)"
  value       = module.network.vpc_cidr_blocks
}

output "subnet_ids" {
  description = "Map of subnet names to their IDs (from network module)"
  value       = module.network.subnet_ids
}

output "subnet_cidr_blocks" {
  description = "Map of subnet names to their CIDR blocks (from network module)"
  value       = module.network.subnet_cidr_blocks
}

output "public_subnet_ids" {
  description = "List of public subnet IDs (from network module)"
  value       = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  description = "List of private subnet IDs (from network module)"
  value       = module.network.private_subnet_ids
}