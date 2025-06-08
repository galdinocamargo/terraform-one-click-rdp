Project Purpose
===============

The purpose of **terraform-one-click-rdp** is to create a Windows virtual machine (VM) in any country you need and access it from your laptop with a single click - all within seconds.

This solution is especially helpful for individuals like me who live abroad and often need to access essential online services that are geo-blocked for security reasons - such as government portals or document request systems. Rather than relying on VPN workarounds, which may raise privacy or compliance concerns, this setup offers a secure, direct alternative.

By provisioning a Windows EC2 instance in a targeted AWS region (e.g., Brazil) and preparing it for remote access, this project enables quick, location-specific connectivity. The system automatically retrieves and injects login credentials into a ready-to-use RDP configuration and script, allowing seamless one-click access from a Windows machine (tested on Windows 11).

⭐️ If you find this project useful, please consider [giving it a star on GitHub](https://github.com/galdinocamargo/terraform-one-click-rdp/stargazers) - it helps others discover it!

Tutorial: Deploying a Geo-Located Windows VM with Terraform
===========================================================

Prerequisites
-------------

-   [Terraform](https://www.terraform.io/downloads.html) >= 1.3.0 (tested with v1.8.1)

-   An AWS account with **programmatic access** enabled (Access Key ID and Secret Access Key)

-   A Windows machine (tested on Windows 11)

1\. Set your AWS credentials
----------------------------

Before running Terraform, make sure your AWS credentials are set. For this tutorial, we'll use programmatic access via environment variables. In PowerShell or a VS Code terminal:

```
$env:AWS_REGION="us-east-1"
$env:AWS_ACCESS_KEY_ID="your-access-key-id"
$env:AWS_SECRET_ACCESS_KEY="your-secret-access-key"

```

2\. Clone the repository
------------------------

```
git clone https://github.com/galdinocamargo/terraform-one-click-rdp.git
cd terraform-one-click-rdp

```

3\. Prepare your variables
--------------------------

Create `terraform.tfvars` in the project root with content like this:

```
aws_region              = "sa-east-1"           # Choose the AWS region closest to your target country
availability_zone       = "sa-east-1a"           # Availability zone in that region
key_name                = "windows_rdp_key"
instance_type           = "t3.large"             # Choose based on your performance needs and budget
ami_owner               = "801119661308"         # Amazon official Windows AMIs
ami_name_filter         = "Windows_Server-2022-English-Full-Base-*"
ami_virtualization_type = "hvm"
rdp_port                = 3389
rdp_username            = "Administrator"

```

> 💡 **Note:**
>
> -   You will likely only need to change `aws_region`, `availability_zone`, and optionally `instance_type`.
>
>
> -   Do not choose an instance type lower than `t3.large`. Windows can become very slow and unresponsive, leading to more time and cost to complete your task. This size should be sufficient for typical desktop use.
>
>
> -   You can find a list of AWS regions and availability zones here:\
>     👉 [AWS Regions and Availability Zones](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html)
>
>
> -   Running EC2 instances will incur **real costs**. Make sure to monitor your usage in the [AWS Billing Dashboard](https://console.aws.amazon.com/billing/home) and destroy your instance when not in use with `terraform destroy`.

4\. Initialize Terraform
------------------------

```
terraform init

```

5\. Apply the infrastructure
----------------------------

```
terraform apply

```

Approve with `yes` when prompted.

6\. Connect to the VM
---------------------

After the apply completes:

-   A script `connect.bat` will be created.

Simply double-click `connect.bat` to open the RDP session pre-filled with IP and password credentials.

> ⚠️ **Note:** If your password contains certain characters like `%`, RDP may still prompt for credentials. In that case, just copy the password from `connect.bat` and paste it manually. Feel free to submit a PR to improve this handling.

7\. Clean up
------------

To avoid ongoing AWS charges:

```
terraform destroy

```

Contributing
============

Contributions are welcome and appreciated! Please refer to the [CONTRIBUTING.md](https://galdinocamargo/documentation/CONTRIBUTING.md) guide for details.

License
=======

This project is licensed under the MIT License. See the `LICENSE` file for details.

Disclaimer
==========

Use this solution responsibly. Ensure compliance with the terms of service of both AWS and the target systems you intend to access.