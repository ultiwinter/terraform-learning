# setting for terraform
# for versions and providers
terraform {
  required_version = "~> 1.16.0"
  required_providers {
    aws = {
      version = "~> 6.60"
      source  = "hashicorp/aws"
    }
  }

}

provider "aws" {
  region = "eu-central-1"
}

# resource is for infrastructure objects
resource "aws_instance" "my_ec2" {
  ami           = "ami-03b2339b9507d3747"
  instance_type = "t3.micro"
  tags = {
    "Name" = "my_first_ec2"
  }
}

# tf plan -out infra.plan
# tf show infra.plan 
# tf show -json infra.plan | jq

#### targetting a resource
# tf plan -target aws_instance.my_ec2