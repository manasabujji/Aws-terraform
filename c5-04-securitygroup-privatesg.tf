module "private_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.9.0"
  # insert the 3 required variables here

  name        = "private_sg-sg"
  description = "Security group with http and ssh  available ssh port set (egress opened for all)"
  vpc_id      = module.vpc.vpc_id

  

  
  ingress_rules = ["ssh-tcp", "http-80-tcp"]
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]

  egress_rules = ["all-all"]
  tags = local.common_tags
  

}