data "aws_availability_zones" "azs" {
  state = "available"
}
data "aws_subnet_ids" "subnet_ids" {
  vpc_id = var.vpc_id
  filter {
    name   = "tag:Name"
    values = ["*Public*"] # insert values here
  }
}
data "aws_vpc" "myvpc" {
  id = var.vpc_id
}
data "aws_ami" "linux2" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}