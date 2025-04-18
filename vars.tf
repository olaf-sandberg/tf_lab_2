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


variable "ami_id" {
  description = "AMI ID to use for all EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "SSH key name to associate"
  type        = string
}
