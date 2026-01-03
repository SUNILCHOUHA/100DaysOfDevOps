resource "aws_s3_bucket" "remot_bucket" {
  bucket = "infra-bucket-backend-31"

  tags = {
    Name = "backend"
  }
}
