resource "aws_db_instance" "mini_db" {
    allocated_storage = var.allocated_storage
    max_allocated_storage = var.max_allocated_storage
    engine = var.engine
    engine_version = var.engine_version
    instance_class = var.instance_class
    username = var.username
    password = var.password
    skip_final_snapshot = true
    parameter_group_name = var.pgn
    port = var.port
    db_subnet_group_name = aws_db_subnet_group.rds.id
    vpc_security_group_ids = [aws_security_group.mini_sg_db.id]
    publicly_accessible = false
    
}