/* resource "aws_security_group" "allow_tls" {
  name = "terraform-firewall"
  description = "managed by terraform"

  tags = {
    "Name" = "Allow TLS"
  }
} 

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 80
  ip_protocol = "tcp" 
  to_port = 80
}

resource "aws_vpc_security_group_egress_rule" "name" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "-1" # either "-1" or "tcp" but then you have to specify all the ports
} */