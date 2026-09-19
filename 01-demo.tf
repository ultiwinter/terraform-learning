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

# terraform init makes terraform dlownload all the plugin associated with the provider

# modify instance config, form example add a name, add tags

# tp delete a certain resource: tf destroy --target aws_instance.my_ec2

# important: default values are not considered to be your desired state, if
# we change these default values, no impact on plan and apply