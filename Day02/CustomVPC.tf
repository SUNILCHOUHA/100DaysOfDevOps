resource "aws_vpc" "custom" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "CustomeVPC"
    }
}

resource "aws_subnet" "public_sub" {
    vpc_id = aws_vpc.custom.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true
    tags = {
      Name = "public_sub"
    }

}

resource "aws_subnet" "private_sub" {
    vpc_id = aws_vpc.custom.id
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = false
    tags = {
      Name = "private_sub"
    }
}

resource "aws_internet_gateway" "custom_IG" {
    vpc_id = aws_vpc.custom.id
}

resource "aws_eip" "eip" {
    domain = "vpc"
    tags = {
      Name = "nat_eip"
    }
}   

resource "aws_nat_gateway" "custom_nat" {
    allocation_id = aws_eip.eip.id 
    subnet_id = aws_subnet.private_sub.id 

    tags = {
      Name = "Nat GateWay"
    }
}


resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.custom.id 
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.custom_IG.id 
    }

    tags = {
      Name = "public_rt"
    }
}

resource "aws_route_table" "private_rt" {
    vpc_id = aws_vpc.custom.id 
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.custom_nat.id 
    }

    tags = {
      Name = "private_rt"
    }
}  

resource "aws_route_table_association" "public_rt_asso" {
    subnet_id = aws_subnet.public_sub.id
    route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private_rt_asso" {
    subnet_id = aws_subnet.private_sub.id
    route_table_id = aws_route_table.private_rt.id
}