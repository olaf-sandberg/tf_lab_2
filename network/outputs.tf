output "igw_ids" {
  value = { for k, igw in aws_internet_gateway.this : k => igw.id }
}

output "subnet_ids" {
  value = { for key, subnet in aws_subnet.this : key => subnet.id }
}

output "subnet_ids_list" {
  value = [for subnet in aws_subnet.this : subnet.id]
}


