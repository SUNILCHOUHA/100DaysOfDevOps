terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket         = "infra-bucket-backend-31"
    key = "terraform/terraform.tfstate"
    region         = "us-east-1"
    # dynamodb_table = "state-lock"
    use_lockfile = true
    encrypt        = true
  }
}


