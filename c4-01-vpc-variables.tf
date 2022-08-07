variable "vpc_name" {
  description = "name is assigning here"
  type = string
  default = "myvpc"

}
variable "vpc_cidr_block" {
  description = "vpc cidr block is assign ing here "
  type =  string 
  default = "10.0.0.0/16"
}

variable "vpc_availability_zones" {
  description = "azs are assigning here"
  type = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "vpc_public_subnets" {
  description = "public subents are assigning here "
  type = list(string) 
  default = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "vpc_private_subnets" {
  description = "private subents are assigning here "
  type = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "vpc_database_subnets" {
  description = "VPC Database Subnets"
  type = list(string)
  default = ["10.0.151.0/24", "10.0.152.0/24"]
}