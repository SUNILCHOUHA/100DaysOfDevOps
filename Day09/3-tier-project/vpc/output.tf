output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnet_ids" {
  value = values(aws_subnet.public_sub)[*].id
}

output "private_sub_app_ids" {
  value = values(aws_subnet.private_sub_app)[*].id
}

output "private_sub_rds_ids" {
  value = values(aws_subnet.private_sub_rds)[*].id
}


