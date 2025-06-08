resource "local_file" "rdp_config" {
  filename = "windows-instance.rdp"
  content  = <<EOT
full address:s:${var.public_ip}:${var.rdp_port}
username:s:${var.username}
prompt for credentials:i:0
EOT
}

resource "local_file" "connect_script" {
  filename = "connect.bat"
  content  = <<EOT
@echo off
cmdkey /delete:TERMSRV/${var.public_ip} 2>nul
cmdkey /generic:TERMSRV/${var.public_ip} /user:${var.username} /pass:"${replace(var.admin_pass, "\"", "\\\"")}"
start "" mstsc.exe "windows-instance.rdp"
EOT
}