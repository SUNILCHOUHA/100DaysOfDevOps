module "stg-infra" {
  source         = "../infra_code"
  env            = "stg"
  vpc_cidr       = "10.0.0.0/16"
  sub_cidr       = "10.0.1.0/24"
  sg_cidr        = "0.0.0.0/0"
  ami            = "ami-0ecb62995f68bb549"
  instance_type  = "t2.nano"
  instance_count = 1
}

# module "prd" {
#     source = "../infra_code"
#     env = "prd"
#     vpc_cidr = "10.0.0.0/16"
#     sub_cidr = "10.0.1.0/24"
#     sg_cidr = "0.0.0.0/0"
#     ami = "ami-0ecb62995f68bb549"
#     instance_type = "t3.micro"
#     instance_count = 2
# }


# module "stg" {
#     source = "../infra_code"
#     env = "stg"
#     vpc_cidr = "10.0.0.0/16"
#     sub_cidr = "10.0.1.0/24"
#     sg_cidr = "0.0.0.0/0"
#     ami = "ami-0ecb62995f68bb549"
#     instance_type = "t2.small"
#     instance_count = 1
#     }