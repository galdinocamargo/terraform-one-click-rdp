############################
# modules/compute/main.tf
############################

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


################################
# modules/compute/variables.tf
################################

variable "ami_owner" {
  description = "AWS account ID that owns the Windows AMI"
  type        = string
}

variable "ami_name_filter" {
  description = "Name filter for the Windows AMI"
  type        = string
}

variable "ami_virtualization_type" {
  description = "Virtualization type filter for the Windows AMI"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "Name of the EC2 key pair to use"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the EC2 instance"
  type        = string
}

variable "sg_id" {
  description = "Security group ID for the EC2 instance"
  type        = string
}


############################
# modules/compute/outputs.tf
############################

output "public_ip" {
  value = aws_instance.windows.public_ip
}

output "admin_password" {
  value     = rsadecrypt(aws_instance.windows.password_data, var.private_key_pem)
  sensitive = true
}

############################
# Additional Input Variable
############################

variable "private_key_pem" {
  description = "PEM format private key used to decrypt the Windows password"
  type        = string
  sensitive   = true
}
