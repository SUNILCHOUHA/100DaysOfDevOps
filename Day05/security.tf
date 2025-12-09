resource "aws_security_group" "mini_sg_ec2" {
    vpc_id = aws_vpc.mini_vpc.id
    tags = {
      Name = "mini_sg_ec2"
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

}


resource "aws_security_group" "mini_sg_db" {
    vpc_id = aws_vpc.mini_vpc.id
    tags = {
      Name = "mini_sg_db"
    }

    ingress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        security_groups = [aws_security_group.mini_sg_ec2.id]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

}