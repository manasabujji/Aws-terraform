terraform {
  required_version = "~> v1.1.7"
  required_providers {
    aws =  {
       source = "hashicorp/aws"  
       version = "~> 4.23.0" 
    }
    null = {
      source = "hashicorp/null"
      version = "~> 3.1.1"
   
    }
  }

}
provider "aws"  {
  region = var.aws_region
  profile = "default"
}