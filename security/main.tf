resource "aws_security_group" "pub" {
  for_each = {
    for k, v in var.vpcs : "sg_${v.name}_pub" => v
  }

  name        = each.key
  description = "Allow SSH from anywhere"
  vpc_id      = var.aws_vpc_ref[each.value.name]

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "ICMP (ping) from anywhere"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = each.key
  }
}

resource "aws_security_group" "priv" {
  for_each = {
    for k, v in var.vpcs : "sg_${v.name}_priv" => v
  }

  name        = each.key
  description = "Allow SSH from public SG"
  vpc_id      = var.aws_vpc_ref[each.value.name]

  ingress {
    description = "SSH from public SG"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [
      aws_security_group.pub["sg_${each.value.name}_pub"].id
    ]
  }

  ingress {
    description = "ICMP (ping) from anywhere"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = each.key
  }
}
