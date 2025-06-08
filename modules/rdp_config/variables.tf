variable "public_ip" {
  description = "Public IP of the Windows EC2 instance"
  type        = string
}

variable "username" {
  description = "Username to use for RDP login"
  type        = string
}

variable "admin_pass" {
  description = "Administrator password of the Windows EC2 instance"
  type        = string
  sensitive   = true
}

variable "private_key_pem" {
  description = "Private key used for decrypting the Windows password"
  type        = string
  sensitive   = true
}

variable "rdp_port" {
  description = "RDP port number"
  type        = number
}

