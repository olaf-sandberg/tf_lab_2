vpcs = {
  "VPC_Poland" = {
  cidr_block = "10.0.0.0/16"
  name       = "VPC_Poland"
  }
    "VPC_Germany" = {
  cidr_block = "10.100.0.0/16"
  name       = "VPC_Germany"
  }
}

subnets = {
  "s_pol_pub" = {
    cidr_block = "10.0.1.0/24"
    name       = "s_pol_pub"
    vpc_key = "VPC_Poland"
  },
  "s_pol_priv" = {
    cidr_block = "10.0.2.0/24"
    name       = "s_pol_priv"
    vpc_key = "VPC_Poland"
  }
    "s_ger_pub" = {
    cidr_block = "10.100.1.0/24"
    name       = "s_ger_pub"
    vpc_key = "VPC_Germany"
  },
  "s_ger_priv" = {
    cidr_block = "10.100.2.0/24"
    name       = "s_ger_priv"
    vpc_key = "VPC_Germany"
  }
}