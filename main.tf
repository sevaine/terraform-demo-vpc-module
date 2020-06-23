terraform {
  required_version = ">= v0.12.26"

  backend "local" {
    path = "terraform.tfstate"
  }
}

provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc/"
  vpc_name = var.vpc_name
  public_cidrs = var.public_cidrs
  private_cidrs = var.private_cidrs
  region = var.region
  vpc_cidr = var.vpc_cidr
}