#create security group
resource "aws_security_group" "sg" {
    vpc_id = "vpc-069aae71753a8ec67"
    name = "cdec-b57-sg"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]

    }

    ingress {
        from_port = 80
        to_port = 80
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

#create instance
resource "aws_instance" "vm" {
    ami = "ami-02040ca09ead0f460"
    instance_type = "t2.micro"
    key_name = "jenkins-key"
    vpc_security_group_ids = [aws_security_group.sg.id]
    user_data = <<-EOF 
     #!/bin/bash
     sudo -i
     yum install httpd -y 
     systemctl start httpd 
     systemctl enable httpd 
     echo "Hello Terraform" > /var/www/html/index.html
    EOF
    tags = {
        Name = "newserver"
    }
}

#note: change values
