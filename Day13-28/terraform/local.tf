locals {
  env = terraform.workspace
}

locals {
  instance_type_map = {
    dev  = "t2.micro"
    stg  = "t2.small"
    prod = "t2.medium"
  }

  ami_id_map = {
    dev = "ami-068c0051b15cdb816"
    stg = "ami-068c0051b15cdb816"
    prod = "ami-0ecb62995f68bb549"
  }

  instance_count_map = {
    dev = 1
    stg = 1
    prod = 2
  }
  ami = local.ami_id_map[terraform.workspace]
  instance_type = local.instance_type_map[terraform.workspace]
  instance_count = local.instance_count_map[terraform.workspace]
}