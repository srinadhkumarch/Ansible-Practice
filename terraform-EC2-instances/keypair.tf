resource "aws_key_pair" "mskec2_key" {
  key_name   = var.key_name
  public_key = file(var.key_public_path)
  tags = {
    terraform = true
    Name      = var.key_name
  }
}