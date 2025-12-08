output "public_ip" {
  value = aws_instance.db_instance.public_ip
}

output "public_dns" {
  value = aws_instance.db_instance.public_dns
}

output "rds_endpoint" {
  value = aws_db_instance.mydb.endpoint
}