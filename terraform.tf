terraform {
  required_version = "~> 1.1.7"
  required_providers {
    aws = {
      source = "hashicorp/terraform-provider-aws"
      version = "~> 4.4.0"

     }
  }
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "single-instance"

  ami                    = "ami-ebd02392"
  instance_type          = "t2.micro"
  key_name               = "user1"
  monitoring             = true
  vpc_security_group_ids = ["sg-12345678"]
  subnet_id              = "subnet-eddcdzz4"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
  
provider "aws" {
  region = "us-east-1"  
  access_key = "AKIAYZAFCA4G642MXWXS" 
  secret_key = "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"
}
