resource "aws_key_pair" "infra_key" {
    key_name = "${var.env}-infra-key-pair"
    public_key = file("infra-key-pair.pub")
    tags = {
      Environment = var.env
    }
}

resource "aws_vpc" "infra_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${var.env}-vpc"
    Environment = var.env
  }
}

resource "aws_subnet" "public" {
    vpc_id = aws_vpc.infra_vpc.id
    cidr_block = var.sub_cidr
    map_public_ip_on_launch = true
    tags = {
      Name = "${var.env}-subnet"
      Environment = var.env
    }
}

resource "aws_security_group" "infra_sg" {
    vpc_id = aws_vpc.infra_vpc.id
    name = "${var.env}-sg"


    ingress {
        from_port = 22
        to_port = 22
        cidr_blocks = [var.sg_cidr]
        protocol = "tcp"
    }

    egress {
        from_port = 0
        to_port = 0
        cidr_blocks = [var.sg_cidr]
        protocol = "-1"
    }
}


resource "aws_instance" "infra_server" {
    count = var.instance_count
    key_name = aws_key_pair.infra_key.key_name
    vpc_security_group_ids = [aws_security_group.infra_sg.id]
    subnet_id = aws_subnet.public.id
    ami = var.ami
    instance_type = var.instance_type
    root_block_device {
      volume_size = var.env == "prd" ? 20 : 10
      volume_type = "gp3"
    }

    tags = {
      Name = "${var.env}-server"
      Environment = var.env
    }
}