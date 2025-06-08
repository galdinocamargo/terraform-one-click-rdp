variable "availability_zone" {
  description = "Availability zone for default subnet lookup"
  type        = string
}

variable "rdp_port" {
  description = "Port number for RDP"
  type        = number
}

variable "my_ip" {
  description = "The public IP of the user running Terraform, in CIDR format"
  type        = string
}