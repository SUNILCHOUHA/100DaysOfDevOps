resource "aws_key_pair" "key_pair" {
  key_name   = "db-instance-key"
  public_key = file("db-instance-key.pub")
}


resource "aws_default_vpc" "vpc" {

}

resource "aws_security_group" "db_sg" {
  vpc_id      = aws_default_vpc.vpc.id
  description = "Database connect"
  tags = {
    Name = "db-sg"

  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    description = "databese access"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    description = "SSH"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "db_instance" {
  ami                    = "ami-0ecb62995f68bb549"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  key_name               = aws_key_pair.key_pair.id

  root_block_device {
    volume_size = 10
    volume_type = "gp3"
  }
}