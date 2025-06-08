output "key_name" {
  value = aws_key_pair.rdp_key.key_name
}

output "private_key_pem" {
  value     = tls_private_key.rdp_key.private_key_pem
  sensitive = true
}