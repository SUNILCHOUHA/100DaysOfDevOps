resource "aws_s3_bucket" "demo" {
    bucket = "demo-bucker-06-12-25"

    tags = {
      Name = "demo-bucket"
      Environmet = "dev"
    }
}


resource "aws_s3_bucket_public_access_block" "demo" {
    bucket = aws_s3_bucket.demo.id
    block_public_acls = true
    block_public_policy = true
    ignore_public_acls = true
    restrict_public_buckets = true
}


resource "aws_s3_bucket_versioning" "demo" {

    bucket = aws_s3_bucket.demo.id
    versioning_configuration {
      status = "Enabled"
    }
}