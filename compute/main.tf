# Public EC2 Instance (Bastion)
resource "aws_instance" "public" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_ids[0]
  vpc_security_group_ids      = [var.public_sg_id]
  associate_public_ip_address = true
  key_name                    = var.key_name
}

# Elastic IP for Public Instance
resource "aws_eip" "bastion_eip" {
  instance = aws_instance.public.id
  domain   = "vpc"
}

# Public EC2 Instance (Web)
resource "aws_instance" "web" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_ids[1]
  vpc_security_group_ids      = [var.public_sg_id]
  associate_public_ip_address = true
  key_name                    = var.key_name
}

# Elastic IP for Public Instance
resource "aws_eip" "web_eip" {
  instance = aws_instance.web.id
  domain   = "vpc"
}

# Private EC2 Instance 1
resource "aws_instance" "private1" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_ids[0]
  vpc_security_group_ids = [var.private_sg_id]
  key_name               = var.key_name
}

# Private EC2 Instance 2
resource "aws_instance" "private2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_ids[0]
  vpc_security_group_ids = [var.private_sg_id]
  key_name               = var.key_name
}

# Private EC2 Instance 3
resource "aws_instance" "private3" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_ids[1]
  vpc_security_group_ids = [var.private_sg_id]
  key_name               = var.key_name
}

# Private EC2 Instance 4
resource "aws_instance" "private4" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_ids[1]
  vpc_security_group_ids = [var.private_sg_id]
  key_name               = var.key_name
}