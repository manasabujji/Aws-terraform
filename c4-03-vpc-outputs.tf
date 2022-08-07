output "vpc_id" {
  description = "vpc_id is assigning here"

  value = module.vpc.vpc_id
}
output "vpc_cidr_block" {
  description = "vpc codr block is mentioned here "
  value = module.vpc.vpc_cidr_block
}
output "public_subnets" {
  description = "public subnets are here "
  value = module.vpc.public_subnets
}
output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = [module.vpc.private_subnets[0], module.vpc.private_subnets[1]]
}
output "azs" {
  description = "A list of availability zones spefified as argument to this module"
  value       = module.vpc.azs
}
