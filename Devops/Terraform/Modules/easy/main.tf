 module "vpc" {
   source = "./modules/vpc"
   vpc_cidr_block = "192.168.0.0/16"
   subnet_cidr_block = "192.168.0.0/22"
   az = "sa-east-1a"
   public_ip = true
 }


module "ec2" {
  source = "./modules/ec2"
  ami_id = "ami-02040ca09ead0f460"
  ins_type = "t2.micro"
  key = "jenkins-key"
  subnet_id = module.vpc.subnet_id
  security_group_id = module.vpc.security_group_id
}
