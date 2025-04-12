vpcs = {
  "VPC_A" = {
  cidr_block = "10.100.0.0/16"
  name       = "tf_lab_2_vpc_a"
  }
    "VPC_B" = {
  cidr_block = "10.200.0.0/16"
  name       = "tf_lab_2_vpc_b"
  }
}

subnets = {
  "public_a" = {
    cidr_block = "10.100.0.0/24"
    name       = "tf_subnet_pub_a"
  },
  "private_a" = {
    cidr_block = "10.100.1.0/24"
    name       = "tf_subnet_priv_a"
  }
    "public_b" = {
    cidr_block = "10.200.0.0/24"
    name       = "tf_subnet_pub_b"
  },
  "private_b" = {
    cidr_block = "10.200.1.0/24"
    name       = "tf_subnet_priv_b"
  }
}