# networking

This module locates the default VPC and subnet in a specified AZ, and creates a security group allowing RDP access only from your public IP.

## Inputs

| Name               | Description                                 | Type   | Required |
|--------------------|---------------------------------------------|--------|----------|
| availability_zone  | The AWS availability zone to target         | string | yes      |
| rdp_port           | Port number for RDP (usually 3389)          | number | yes      |
| my_ip              | The public IP (in CIDR) to allow RDP from   | string | yes      |

## Outputs

| Name       | Description             |
|------------|-------------------------|
| subnet_id  | ID of the selected subnet |
| sg_id      | ID of the created security group |
