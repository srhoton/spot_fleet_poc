resource "aws_security_group" "circleci_sg" {
  name = "ec2_sg"
  description = "Allow SSH and HTTP"
  vpc_id = data.aws_vpc.dev_vpc.id
}

resource "aws_vpc_security_group_ingress_rule" "circleci_sg_ssh" {
  security_group_id = aws_security_group.circleci_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port = 22
  to_port = 22
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "circleci_outbound" {
  security_group_id = aws_security_group.circleci_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol = "-1"
}
