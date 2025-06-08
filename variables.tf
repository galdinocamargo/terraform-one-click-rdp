variable "aws_region" {
  description = "AWS region to provision into"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone for default subnet lookup"
  type        = string
}

variable "key_name" {
  description = "Name to give the AWS key pair"
  type        = string
}

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

variable "rdp_username" {
  description = "Windows username for RDP"
  type        = string
}

variable "rdp_port" {
  description = "Port number for RDP"
  type        = number
}
