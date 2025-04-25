aws_region = "eu-central-1"

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
    vpc_key    = "VPC_Poland"
    availability_zone = "eu-central-1a"
  },
    "s_pol_pub2" = {
    cidr_block = "10.0.10.0/24"
    name       = "s_pol_pub2"
    vpc_key    = "VPC_Poland"
    availability_zone = "eu-central-1b"
  },
  "s_pol_priv" = {
    cidr_block = "10.0.2.0/24"
    name       = "s_pol_priv"
    vpc_key    = "VPC_Poland"
    availability_zone = "eu-central-1c"
  },
  "s_ger_pub" = {
    cidr_block = "10.100.1.0/24"
    name       = "s_ger_pub"
    vpc_key    = "VPC_Germany"
    availability_zone = "eu-central-1b"
  },
  "s_ger_pub2" = {
    cidr_block = "10.100.10.0/24"
    name       = "s_ger_pub2"
    vpc_key    = "VPC_Germany"
    availability_zone = "eu-central-1a"
  },
  "s_ger_priv" = {
    cidr_block = "10.100.2.0/24"
    name       = "s_ger_priv"
    vpc_key    = "VPC_Germany"
    availability_zone = "eu-central-1c"
  },

    "s_ger_priv2" = {
    cidr_block = "10.100.3.0/24"
    name       = "s_ger_priv2"
    vpc_key    = "VPC_Germany"
    availability_zone = "eu-central-1a"
  },
   "s_pol_priv2" = {
    cidr_block = "10.0.3.0/24"
    name       = "s_pol_priv2"
    vpc_key    = "VPC_Poland"
    availability_zone = "eu-central-1b"
  }

  

}


igw_routes = {
  s_pol_pub = true
  s_ger_pub = true
}

ami_id        = "CHANGE TO AMI FOR WEBSERVER"
instance_type = "t3.micro"
key_name      = "LAB-OLO"
