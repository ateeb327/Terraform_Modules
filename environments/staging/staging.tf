provider "aws" {
  region = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module "vpc" {
  source             = "../../modules/vpc"
  cidr_block         = var.cidr_block
  private_subnet_cidr = var.private_subnet_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  VPC_Name = var.VPC_Name
  private_subnet_name = var.private_subnet_name
  public_subnet_name = var.public_subnet_name
  internet_gateway_name = var.internet_gateway_name
  tags = var.tags
}

module "ec2" {
  source          = "../../modules/ec2"
  instance_type   = var.instance_type
  subnet_id       = module.vpc.public_subnet_id  
  public_key        = var.public_key
  instance_name   = var.instance_name
  tags            = var.tags  
  public_subnets = [module.vpc.public_subnet_id]
  vpc_id          = module.vpc.vpc_id
}

