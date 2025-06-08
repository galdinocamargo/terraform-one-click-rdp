# utils/ip

This module fetches the public IP of the machine running Terraform using `api.ipify.org`, and returns it in CIDR format for use in security group rules.

## Outputs

| Name     | Description              |
|----------|--------------------------|
| ip_cidr  | Your IP address in /32 format |
