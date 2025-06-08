output "public_ip" {
  value = aws_instance.windows.public_ip
}

output "admin_password" {
  value     = rsadecrypt(aws_instance.windows.password_data, var.private_key_pem)
  sensitive = true
}