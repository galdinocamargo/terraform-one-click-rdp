output "instance_public_ip" {
  value = module.compute.public_ip
}

output "admin_password" {
  value     = module.compute.admin_password
  sensitive = true
}

output "private_key_pem" {
  value     = module.keypair.private_key_pem
  sensitive = true
}