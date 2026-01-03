module "infra" {
  source         = "./infra_code"
  env            = local.env
  vpc_cidr       = "10.0.0.0/16"
  sub_cidr       = "10.0.1.0/24"
  sg_cidr        = "0.0.0.0/0"
  ami            = local.ami
  instance_type  = local.instance_type
  instance_count = local.instance_count
}
