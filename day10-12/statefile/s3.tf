resource "aws_s3_bucket" "state_bucket" {
  bucket = "backend-state-3-tier"

  tags = {
    Name = "Backend"
  }
}