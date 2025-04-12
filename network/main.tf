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

  vpc_id            = aws_vpc.this[each.key].id
  cidr_block        = each.value.cidr_bloc

tags = merge(
    {
      Name = each.vale.name
    },
    var.common_tags
  )
}