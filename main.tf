# Fetch external IP to restrict RDP access
module "ip" {
  source = "./modules/utils/ip"
}

locals {
  my_ip = module.ip.ip_cidr
}

# Generate key pair
module "keypair" {
  source   = "./modules/keypair"
  key_name = var.key_name
}

# Setup networking (VPC, subnet, SG)
module "networking" {
  source            = "./modules/networking"
  availability_zone = var.availability_zone
  rdp_port          = var.rdp_port
  my_ip             = local.my_ip
}

# Launch EC2 instance
module "compute" {
  source                  = "./modules/compute"
  ami_owner               = var.ami_owner
  ami_name_filter         = var.ami_name_filter
  ami_virtualization_type = var.ami_virtualization_type
  instance_type           = var.instance_type
  key_name                = module.keypair.key_name
  subnet_id               = module.networking.subnet_id
  sg_id                   = module.networking.sg_id
  private_key_pem         = module.keypair.private_key_pem
}

# Create RDP and connection script
module "rdp_config" {
  source          = "./modules/rdp_config"
  public_ip       = module.compute.public_ip
  username        = var.rdp_username
  admin_pass      = module.compute.admin_password
  private_key_pem = module.keypair.private_key_pem
  rdp_port        = var.rdp_port
}