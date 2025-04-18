output "public_sg_ids" {
  value = {
    for k, sg in aws_security_group.pub : k => sg.id
  }
}

output "private_sg_ids" {
  value = {
    for k, sg in aws_security_group.priv : k => sg.id
  }
}