module "ec2" {
  source = "../custom_modules"
  ami = "ami-0ecb62995f68bb549"
  instance_type = "t2.micro"
  env = "dev"
  cidr_blocks = "0.0.0.0/0"
  root_block_device = 10
}