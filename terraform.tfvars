vpcs = {
  cidr_block = "10.100.0.0/16"
  name       = "tf_lab_2_vpc"
}

subnets = {
  "public" = {
    cidr_block = "10.100.0.0/24"
    name       = "tf_subnet_pub"
  },
  "private" = {
    cidr_block = "10.100.1.0/24"
    name       = "tf_subnet_priv"
  }
}