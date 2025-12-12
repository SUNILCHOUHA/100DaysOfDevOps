resource "aws_s3_bucket" "remot_bucket" {
    bucket = "infra-bucket-9"

    tags = {
      Name = "backend"
    }   
}
