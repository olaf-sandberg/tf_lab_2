variable "aws_region" {
  description = "AWS region"
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
  description = "Map of subnets"
  type = map(object({
    cidr_block = string
    name       = string
  }))
}

variable "common_tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
}