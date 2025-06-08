# compute

This module launches a Windows EC2 instance using the latest AMI that matches a filter, within a given subnet and security group. It also decrypts the administrator password.

## Inputs

| Name                    | Description                               | Type   | Required |
|-------------------------|-------------------------------------------|--------|----------|
| ami_owner               | Owner ID of the Windows AMI               | string | yes      |
| ami_name_filter         | Name pattern to match Windows AMI         | string | yes      |
| ami_virtualization_type | AMI virtualization type (e.g., hvm)       | string | yes      |
| instance_type           | EC2 instance type                         | string | yes      |
| key_name                | Name of the key pair to use               | string | yes      |
| subnet_id               | Subnet ID to launch instance into         | string | yes      |
| sg_id                   | Security group ID to attach               | string | yes      |
| private_key_pem         | Private key to decrypt admin password     | string | yes      |

## Outputs

| Name            | Description                          |
|-----------------|--------------------------------------|
| public_ip       | Public IP of the launched instance   |
| admin_password  | Decrypted Windows administrator password (sensitive) |
