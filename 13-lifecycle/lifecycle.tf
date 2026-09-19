provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-03b2339b9507d3747"
  instance_type = "t3.micro"

  tags = {
    "Name" = "my_first_ec22"
  }

  lifecycle {
    # create the replacement instance first before destroying the other. in prod important
    create_before_destroy = true
    # prevent destruction any resource
    prevent_destroy = true
    # ignore changes in some attributes in aws_instance
    ignore_changes = [ tags, instance_type ]
  }
}