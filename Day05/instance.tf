resource "aws_key_pair" "mini_key_pair" {
    key_name = "mini-key-pair"
    public_key = file("mini-key-pair.pub")
}


resource "aws_instance" "mini_ec2" {
    ami = var.ami
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.mini_sg_ec2.id]
    key_name = aws_key_pair.mini_key_pair.key_name
    subnet_id = aws_subnet.public_sub["public_sub1"].id 

    root_block_device {
      volume_size = var.root_block_device
      volume_type = "gp3"
    }
    user_data = file("script.sh")

    tags = {
      Name = "mini-ec2"
    }

}