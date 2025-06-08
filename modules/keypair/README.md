# keypair

This module generates an RSA private key and creates an AWS EC2 key pair using the generated public key.

## Inputs

| Name      | Description                  | Type   | Required |
|-----------|------------------------------|--------|----------|
| key_name  | Name to assign to the key pair | string | yes      |

## Outputs

| Name             | Description                          |
|------------------|--------------------------------------|
| key_name         | Name of the created AWS key pair     |
| private_key_pem  | Private key in PEM format (sensitive) |

## Notes

- The private key is generated locally and not stored in AWS.
