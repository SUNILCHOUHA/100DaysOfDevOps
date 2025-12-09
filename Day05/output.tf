output "public_ip" {
  value = aws_instance.mini_ec2.public_ip
}

output "private_ip" {
  value = aws_instance.mini_ec2.private_ip
}

output "db_endpoint" {
  value = aws_db_instance.mini_db.endpoint
}

output "public_dns" {
  value = aws_instance.mini_ec2.public_dns
}