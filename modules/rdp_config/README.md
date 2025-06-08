# rdp_config

This module generates a `.rdp` file and a `.bat` script that stores credentials and launches the Windows Remote Desktop client.

## Inputs

| Name             | Description                                  | Type   | Required |
|------------------|----------------------------------------------|--------|----------|
| public_ip        | Public IP of the Windows EC2 instance        | string | yes      |
| username         | RDP login username                           | string | yes      |
| admin_pass       | Windows admin password (sensitive)           | string | yes      |
| private_key_pem  | Private key used for password decryption     | string | yes      |
| rdp_port         | Port for RDP                                 | number | yes      |

## Outputs

- No outputs defined.
