data "aws_ami" "amazon" {
  most_recent = true 
  owners = ["137112412989"]

  filter {
    name = "name"
    values = ["al2023-ami-2023.9.20251110.1-kernel-6.1-x86_64"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }


}


resource "aws_instance" "vm" {
  ami = data.aws_ami.amazon.id 
  instance_type = "t2.micro"
  key_name = "id_rsa"
  tags = {
    Name = "vm-1"
  }
  
}

