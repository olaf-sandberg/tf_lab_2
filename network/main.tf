data "aws_region" "current" {
  name = var.aws_region
}

resource "aws_vpc" "this" {
  for_each = var.vpcs

  cidr_block = each.value.cidr_block

  tags = merge(
    {
      Name = each.value.name
    },
    var.common_tags
  )
}

resource "aws_subnet" "this" {
  for_each = var.subnets

  vpc_id            = aws_vpc.this[each.value.vpc_key].id
  cidr_block        = each.value.cidr_block

tags = merge(
    {
      Name = each.value.name
    },
    var.common_tags
  )
}

resource "aws_internet_gateway" "this" {
  for_each = var.vpcs

  vpc_id = aws_vpc.this[each.key].id

  tags = merge(
    {
      Name = "${each.value.name}-igw"
    },
    var.common_tags
  )
}

resource "aws_route_table" "this" {
  for_each = var.subnets

  vpc_id = aws_vpc.this[each.value.vpc_key].id

  tags = {
    Name = "${each.value.name}_rt"
  }
}

resource "aws_route_table_association" "this" {
  for_each = var.subnets

  subnet_id      = aws_subnet.this[each.key].id
  route_table_id = aws_route_table.this[each.key].id
}

resource "aws_route" "igw_route" {
  for_each = {
    for subnet_key, use_igw in var.igw_routes : subnet_key => use_igw
    if use_igw
  }

  route_table_id         = aws_route_table.this[each.key].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this[var.subnets[each.key].vpc_key].id
}