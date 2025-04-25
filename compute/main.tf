# Public EC2 Instance (Bastion)
resource "aws_instance" "public" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [var.public_sg_id]
  associate_public_ip_address = true
  key_name                    = var.key_name
}

# Elastic IP for Public Instance
resource "aws_eip" "bastion_eip" {
  instance = aws_instance.public.id
  domain   = "vpc"
}

# Private EC2 Instance 1
resource "aws_instance" "private1" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = [var.private_sg_id]
  key_name               = var.key_name
}

# Private EC2 Instance 2
resource "aws_instance" "private2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = [var.private_sg_id]
  key_name               = var.key_name
}

# Private EC2 Instance 3
resource "aws_instance" "private3" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_id2
  vpc_security_group_ids = [var.private_sg_id]
  key_name               = var.key_name
}

# Private EC2 Instance 24
resource "aws_instance" "private4" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_id2
  vpc_security_group_ids = [var.private_sg_id]
  key_name               = var.key_name
}