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

variable "private_key_pem" {
  description = "PEM format private key used to decrypt the Windows password"
  type        = string
  sensitive   = true
}