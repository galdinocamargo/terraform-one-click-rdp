output "subnet_id" {
  value = data.aws_subnet.default.id
}

output "sg_id" {
  value = aws_security_group.rdp_sg.id
}
