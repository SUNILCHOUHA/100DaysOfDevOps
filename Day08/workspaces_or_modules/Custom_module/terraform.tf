terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket         = "infra-bucket-9"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "state-lock"
    encrypt        = true
  }
}


