# # AWS EC2 Instance Terraform Module
# # EC2 Instances that will be created in VPC Private Subnets
# module "ec2_private" {
#   depends_on = [ module.vpc ] # VERY VERY IMPORTANT else userdata webserver provisioning will fail
#   source  = "terraform-aws-modules/ec2-instance/aws"
#   version = "2.17.0"
#   # insert the 10 required variables here
#   name                   = "${var.environment}-vm"
#   ami                    = data.aws_ami.amzlinux2.id
#   instance_type          = var.instance_type
#   key_name               = var.instance_keypair
#   #monitoring             = true
#   vpc_security_group_ids = [module.private_sg.this_security_group_id]
#   #subnet_id              = module.vpc.public_subnets[0]  
#   subnet_ids = [
#     module.vpc.private_subnets[0],
#     module.vpc.private_subnets[1]
#   ]  
#   instance_count         = var.private_instance_count
#   user_data = file("${path.module}/app1-install.sh")
#   tags = local.common_tags
# }


module "ec2_private" {
   
  depends_on = [ module.vpc ]
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.1.1"
  
  name = "${var.environment}-PrivateHost-${count.index}"

  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
 # monitoring             = true
  vpc_security_group_ids =[module.private_sg.security_group_id]
  # subnet_id = [
  #   module.vpc.private_subnets[0],
  #   module.vpc.private_subnets[1]
  # ]
  
  
  #subnet_id = module.vpc.private_subnets[0]
  count =  var.private_instance_count
   subnet_id = "${element(module.vpc.private_subnets, count.index)}"
  
  user_data  = ("${path.module}/app1-install.sh")
  
  tags = local.common_tags
 

}

