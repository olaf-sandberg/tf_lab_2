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