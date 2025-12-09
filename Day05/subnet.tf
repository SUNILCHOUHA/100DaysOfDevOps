resource "aws_subnet" "public_sub" {
    vpc_id = aws_vpc.mini_vpc.id
    map_public_ip_on_launch = true
    for_each = {
      "public_sub1" = "10.0.1.0/24"
      "public_sub2" = "10.0.2.0/24"
    }

    cidr_block = each.value
    tags = {
      Name = each.key
    }
    
}

resource "aws_subnet" "private_sub" {
    vpc_id = aws_vpc.mini_vpc.id
    map_public_ip_on_launch = true
    for_each = {
      "private_sub1" = {cidr_block = "10.0.3.0/24", az = "us-east-1a"}
      "private_sub2" = {cidr_block = "10.0.4.0/24", az = "us-east-1b"}
    }

    cidr_block = each.value.cidr_block
    availability_zone = each.value.az
    tags = {
      Name = each.key
    }
    
}

resource "aws_db_subnet_group" "rds" {
  subnet_ids = [
    aws_subnet.private_sub["private_sub1"].id,
    aws_subnet.private_sub["private_sub2"].id 
  ]
}