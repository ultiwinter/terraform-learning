provider "aws" {
  region = "eu-central-1"
}
resource "aws_eip" "lb" {
  domain = "vpc"
}

resource "aws_instance" "web" {
  ami           = "ami-03b2339b9507d3747"
  instance_type = "t3.micro"
}

resource "aws_security_group" "allow_tls" {
  name = "terraform-firewall"
  description = "managed by terraform"

  tags = {
    "Name" = "Allow TLS"
  }
} 

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4 = "${aws_eip.lb.public_ip}/32" # /smth (32) is a must
  from_port = 80
  ip_protocol = "tcp" 
  to_port = 80
}

output "public-ip" {
  value = aws_eip.lb.public_ip
}