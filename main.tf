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