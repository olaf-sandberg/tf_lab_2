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
  source = "./modules/network"

  vpcs = var.vpcs
  subnets    = var.subnets
  aws_region = var.aws_region
  common_tags = local.common_tags

}