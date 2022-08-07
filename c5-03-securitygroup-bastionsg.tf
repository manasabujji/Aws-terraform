module "public_bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.9.0"
  # insert the 3 required variables here

  name        = "public_bastion-sg"
  description = "Security group with all available ssh port set (egress opened for all)"
  vpc_id      = module.vpc.vpc_id

  

  
  ingress_rules = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]

  egress_rules = ["all-all"]
  tags = local.common_tags
  

}