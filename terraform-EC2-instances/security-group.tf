resource "aws_security_group" "EC2_SG" {
  name        = var.SG_Name.name
  description = var.SG_Name.description
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.Ingress_list
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.Egress_list
    content {
      from_port        = egress.value.from_port
      to_port          = egress.value.to_port
      protocol         = egress.value.protocol
      cidr_blocks      = egress.value.cidr_blocks
      ipv6_cidr_blocks = egress.value.ipv6_cidr_blocks
    }
  }

  tags = {
    Name      = var.SG_Name.name
    terraform = true
  }
}
