terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "network" {
  source = "./network"

  vpcs = var.vpcs
  subnets    = var.subnets
  aws_region = var.aws_region
  common_tags = local.common_tags
  igw_routes = var.igw_routes

}

module "security" {
  source        = "./security"
  vpcs          = var.vpcs
  aws_vpc_ref   = module.network.vpc_ids
}

module "compute_poland" {
  source = "./compute"

  ami_id             = var.ami_id
  instance_type      = var.instance_type
  key_name           = var.key_name

  public_subnet_id   = module.network.subnet_ids["s_pol_pub"]
  private_subnet_id  = module.network.subnet_ids["s_pol_priv"]
  private_subnet_id2  = module.network.subnet_ids["s_pol_priv2"]

  public_sg_id       = module.security.public_sg_ids["sg_VPC_Poland_pub"]
  private_sg_id      = module.security.private_sg_ids["sg_VPC_Poland_priv"]

}

module "compute_germany" {
  source             = "./compute"

  ami_id             = var.ami_id
  instance_type      = var.instance_type
  key_name           = var.key_name

  public_subnet_id   = module.network.subnet_ids["s_ger_pub"]
  private_subnet_id  = module.network.subnet_ids["s_ger_priv"]
  private_subnet_id2  = module.network.subnet_ids["s_ger_priv2"]

  public_sg_id       = module.security.public_sg_ids["sg_VPC_Germany_pub"]
  private_sg_id      = module.security.private_sg_ids["sg_VPC_Germany_priv"]
}