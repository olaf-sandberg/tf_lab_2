output "public_instance_id" {
  description = "ID of the public EC2 instance"
  value       = aws_instance.public.id
}

output "public_ip" {
  description = "Elastic IP of the public EC2 instance"
  value       = aws_eip.bastion_eip.public_ip
}

output "private_instance_ids" {
  description = "IDs of the private EC2 instances"
  value       = [
    aws_instance.private1.id,
    aws_instance.private2.id
  ]
}