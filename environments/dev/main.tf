module "network" {
  source      = "../../modules/network"
  vpc_cidr    = "10.0.0.0/16"
  subnet_cidr = "10.0.1.0/24"
  az          = "us-east-1a"  # <-- Change to your preferred AZ
  env         = "dev"
}

module "compute" {
  source = "../../modules/compute"

  ami_id            = "ami-0953476d60561c955" # <--  Ubuntu or Amazon Linux AMI ID
  instance_type     = "t2.micro"
  subnet_id         = module.network.public_subnet_id
  security_group_id = module.network.web_sg_id
  key_name          = "May-Key-Pair" # <--  Replace with your EC2 keypair name
  env               = "dev"
}