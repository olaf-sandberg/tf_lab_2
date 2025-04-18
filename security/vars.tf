variable "vpcs" {
  description = "Map of VPC configurations"
  type = map(object({
    cidr_block = string
    name       = string
  }))
}

variable "aws_vpc_ref" {
  description = "Reference to VPC resources from root module"
  type        = map(string)
}