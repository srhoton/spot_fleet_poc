data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_vpc" "dev_vpc" {
  tags = {
    Name = "dev-env-default_vpc"
  }
}
data "aws_subnet" "dev_subnet" {
  vpc_id = data.aws_vpc.dev_vpc.id

  tags = {
    Name = "public-1"
  }
}

