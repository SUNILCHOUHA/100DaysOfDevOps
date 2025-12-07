output "public" {
    value = [
        for k in aws_instance.meta_instance : k.public_ip
    ]
}

output "private" {
    value = [
        for k in aws_instance.meta_instance : k.private_ip
    ]
}