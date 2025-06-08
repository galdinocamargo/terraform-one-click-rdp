output "ip_cidr" {
  description = "The public IP address of the executor in CIDR format"
  value       = "${chomp(data.http.my_ip.response_body)}/32"
}
