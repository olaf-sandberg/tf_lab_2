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
    vpc_key    = string
  }))
}

variable "igw_routes" {
  description = "Subnets that need a default route to IGW"
  type        = map(bool)
}

