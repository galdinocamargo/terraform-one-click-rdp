data "aws_vpc" "default" {
  default = true
}

data "aws_subnet" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
  filter {
    name   = "default-for-az"
    values = ["true"]
  }
  availability_zone = var.availability_zone
}

resource "aws_security_group" "rdp_sg" {
  name        = "windows-rdp-sg"
  description = "Allow RDP from your IP only"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = var.rdp_port
    to_port     = var.rdp_port
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}