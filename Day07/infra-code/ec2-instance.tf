#first create key pair
resource "aws_key_pair" "day02_key" {
    public_key = file("custom-key.pub")
    key_name = "${var.env}-custom-key"
}


# create default vpc for instance use
resource "aws_default_vpc" "day02_vpc" {
  
}

# create a security group to allow access permission
resource "aws_security_group" "day02_sg" {
    name = "${var.env}-sg"
    vpc_id = aws_default_vpc.day02_vpc.id
    ingress {
        from_port = 22
        to_port = 22
        cidr_blocks = [var.cidr_blocks]
        protocol = "tcp"
        description = "Secure Shell access"
    }

    egress  {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [var.cidr_blocks]
        description = "All outbount traffic allow"
    }
}

resource "aws_instance" "day02_server" {
    instance_type = var.instance_type
    ami = var.ami
    key_name = aws_key_pair.day02_key.id
    vpc_security_group_ids = [aws_security_group.day02_sg.id] 

    root_block_device {
      volume_size = var.root_block_device
      volume_type = "gp3"
    }

    tags = {
      Name = "${var.env}-server"
    }
  
}