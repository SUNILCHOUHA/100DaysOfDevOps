resource "aws_key_pair" "key" {
  key_name   = var.key_name
  public_key = file("${path.root}/${var.key_name}.pub")
}
