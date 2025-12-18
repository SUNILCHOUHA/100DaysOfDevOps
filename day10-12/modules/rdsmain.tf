module "rds" {
  source = "../3-tier-project/rdsInstance"
  allocated_storage = 10
  engine = "mysql"
  engine_version = "8.0"
  db_name = "three_tier_db"
  username = "admin"
  db_password = var.db_password
  instance_class = "db.t3.micro"
  env = local.env
  vpc_id = module.vpc.vpc_id 
  subnet_ids = module.vpc.private_sub_rds_ids
  app_sg_id = module.ec2_asg.app_sg_id
}