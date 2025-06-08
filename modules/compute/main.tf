data "aws_ami" "windows" {
  most_recent = true
  owners      = [var.ami_owner]

  filter {
    name   = "name"
    values = [var.ami_name_filter]
  }

  filter {
    name   = "virtualization-type"
    values = [var.ami_virtualization_type]
  }
}

resource "aws_instance" "windows" {
  ami                    = data.aws_ami.windows.id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  key_name               = var.key_name
  vpc_security_group_ids = [var.sg_id]
  get_password_data      = true

  tags = {
    Name = "Windows-RDP"
  }
}