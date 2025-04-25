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

variable "public_subnet_id" {
  description = "Subnet ID for the public instance"
  type        = string
}

variable "private_subnet_id" {
  description = "Subnet ID for the private instances"
  type        = string
}

variable "public_sg_id" {
  description = "Security group ID for the public instance"
  type        = string
}

variable "private_sg_id" {
  description = "Security group ID for the private instances"
  type        = string
}

variable "private_subnet_id2" {
  description = "Subnet ID for the second set of private instances"
  type        = string
}