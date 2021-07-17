resource "aws_instance" "Ansible_Instances" {
  ami           = data.aws_ami.linux2.id
  instance_type = var.instance_type
  # iam_instance_profile   = aws_iam_instance_profile.kafka_ec2_connect_role.id
  key_name               = aws_key_pair.mskec2_key.id
  vpc_security_group_ids = [aws_security_group.EC2_SG.id]
  user_data              = "${file(var.userdata_path)}"
  subnet_id = local.subnet_ids[count.index]
  # count     = length(local.subnet_ids)
  count = 2
  tags = {
    Name      = var.instance_name[count.index]
    terraform = true
  }
}
