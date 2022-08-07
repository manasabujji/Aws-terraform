module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.2"
  # insert the 23 required variables here



  name = var.vpc_name
  cidr = var.vpc_cidr_block # 10.0.0.0/8 is reserved for EC2-Classic

  azs                 = var.vpc_availability_zones
  private_subnets     = var.vpc_private_subnets
  public_subnets      = var.vpc_public_subnets
  database_subnets    = var.vpc_database_subnets


  create_database_subnet_group = true
  create_database_subnet_route_table= true

  enable_nat_gateway = true
  single_nat_gateway = true


  enable_dns_hostnames = true
  enable_dns_support   = true

 public_subnet_tags =  {
  Type = "Public Subnets"

 }
  private_subnet_tags =  {
  Type = "Private Subnets"

 }
 database_subnet_tags =  {
  Type = "Database Subnets"

 }


}