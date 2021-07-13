vpc_id          = "vpc-0c270506c25b85b0f"
instance_type   = "t2.micro"
instance_name   = ["AnsibleInstance_master","AnsibleInstance_slave_1","AnsibleInstance_slave_2"]
key_name        = "AnsibleInstanceKeyPair"
key_public_path = "./key-pair-ssh/ssh_keypair_ec2.pub"
userdata_path   = "./userdata.sh"
SG_Name = {
  "name"        = "AnsibleInsanceSG"
  "description" = "Security Group of Kafka Instance Connect"
}
Ingress_list = [
  {
    description = "Allow All traffic from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # {
  #   description = "TLS from VPC"
  #   from_port   = 80
  #   to_port     = 80
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }
]
Egress_list = [
  {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
]