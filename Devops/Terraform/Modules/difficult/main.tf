 module "vpc" {
   source = "./modules/vpc"
   vpc_cidr_block = var.vpc_cidr_block
   subnet_cidr_block = var.subnet_cidr_block
   az = var.az
   public_ip = var.public_ip
 }


module "ec2" {
  source = "./modules/ec2"
  ami_id = var.ami_id
  ins_type = var.ins_type
  key = var.key
  subnet_id = module.vpc.subnet_id
  security_group_id = module.vpc.security_group_id
}
