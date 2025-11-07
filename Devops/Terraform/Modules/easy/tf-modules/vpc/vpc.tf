resource "aws_vpc" "vnet" {
  cidr_block = var.vpc_cidr_block 
  tags = {
    Name = "cdec-b57-tf-vpc"
  }  
}

resource "aws_subnet" "pub" {
   vpc_id = aws_vpc.vnet.id
   cidr_block = var.subnet_cidr_block 
   availability_zone = var.az 
   map_public_ip_on_launch = var.public_ip 
   tags = {
    Name = "Public-Subnet"
   }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vnet.id 
    tags = {
        Name = "internet-gateway-tf-vpc"
    }
  
}


resource "aws_route_table" "rt-pub" {
  vpc_id = aws_vpc.vnet.id 
  tags = {
    Name = "RT-Public"
  }
  route {
    gateway_id = aws_internet_gateway.igw.id
    cidr_block = "0.0.0.0/0"
  }
}


resource "aws_route_table_association" "rta-pub" {
  route_table_id = aws_route_table.rt-pub.id 
  subnet_id = aws_subnet.pub.id 
}

resource "aws_security_group" "sg" {
    vpc_id = aws_vpc.vnet.id 
    name = "firewall-tf-vpc"

    ingress {
        from_port = 22 
        to_port = 22 
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}
