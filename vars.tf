variable "subnets" {
  description = "Map of subnets to create"
  type = map(object({
    cidr_block         = string
    name               = string
    availability_zone  = string
  }))
}