resource "tls_private_key" "rdp_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "rdp_key" {
  key_name   = var.key_name
  public_key = tls_private_key.rdp_key.public_key_openssh
}