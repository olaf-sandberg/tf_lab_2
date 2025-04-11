variable "aws_region" {
  description = "AWS region to deploy to"
  type        = string
}

variable "vpcs" {
  description = "Map of VPC configurations"
  type = map(object({
    cidr_block = string
    name       = string
  }))
}

variable "subnets" {
  description = "Map of subnet configurations"
  type = map(object({
    cidr_block = string
    name       = string
  }))
}