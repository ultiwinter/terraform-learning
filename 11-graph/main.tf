resource "aws_eip" "lb" {
  domain = "vpc"
}

resource "aws_security_group" "example" {
  name = "attribute-sg"
}

resource "aws_vpc_security_group_ingress_rule" "example" {
  security_group_id = aws_security_group.example.id
  cidr_ipv4 = "${aws_eip.lb.public_ip}/32"
  from_port = 443
  to_port = 443
  ip_protocol = "tcp"
}

resource "aws_instance" "web" {
  ami           = "ami-03b2339b9507d3747"
  instance_type = "t3.micro"
}

# then seearch online "graphviz online"
# and paste what is coming out of the cmd "terraform graph"
# sudo apt install graphviz
# terraform graph | dot -Tpng > graph.png