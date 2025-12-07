# #first create key pair
# resource "aws_key_pair" "day03_key" {
#     public_key = file("day-02-key.pub")
#     key_name = "day-02-key"
# }


# # create default vpc for instance use
# resource "aws_default_vpc" "day03_vpc" {
  
# }

# # create a security group to allow access permission
# resource "aws_security_group" "day03_sg" {
#     name = "day03"
#     vpc_id = aws_default_vpc.day03_vpc.id
#     ingress {
#         from_port = 22
#         to_port = 22
#         cidr_blocks = ["0.0.0.0/0"]
#         protocol = "tcp"
#         description = "Secure Shell access"
#     }

#     egress  {
#         from_port = 0
#         to_port = 0
#         protocol = "-1"
#         cidr_blocks = ["0.0.0.0/0"]
#         description = "All outbount traffic allow"
#     }
# }

# resource "aws_instance" "day03_server" {
#     instance_type = var.instance_type
#     ami = var.ami_id
#     key_name = aws_key_pair.day03_key.id
#     vpc_security_group_ids = [aws_security_group.day03_sg.id] 

#     root_block_device {
#       volume_size = var.root_block_device
#       volume_type = "gp3"
#     }

#     tags = {
#       Name = "day03-server"
#     }
  
# }



resource "aws_key_pair" "meta_key" {
    key_name = "meta-key"
    public_key = file("meta-key.pub")
}


resource "aws_default_vpc" "vpc" {
  
}

resource "aws_security_group" "meta_sg" {
    vpc_id = aws_default_vpc.vpc.id
    description = "Inbount and Outbount trrafic"

    ingress {
        from_port = 22
        to_port = 22
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "tcp"

    }

    egress {
        from_port = 0
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "-1"
    }
}

resource "aws_instance" "meta_instance" {
    # count = 2
    for_each = {
      "instance-1" = "t2.micro"
      "instance-2" = "t3.micro"
      "instance-3" = "t2.medium"
    }
    ami = var.ami_id
    instance_type = each.value
    vpc_security_group_ids = [aws_security_group.meta_sg.id]
    key_name = aws_key_pair.meta_key.id

    root_block_device {
      volume_size = var.root_block_device
      volume_type = "gp3"
    }

    tags = {
        Name = each.key
    }
}