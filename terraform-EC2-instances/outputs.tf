output "EC2_SG" {
  value = aws_security_group.EC2_SG.arn
}
# output "EC2_IAM_ROLE_ARN" {
#   value = aws_iam_instance_profile.kafka_ec2_connect_role.arn
# }
output "keypair_ARN" {
  value = aws_key_pair.mskec2_key.arn
}
output "EC2_public_dns" {
  value = zipmap(aws_instance.Ansible_Instances[*].tags_all.Name,aws_instance.Ansible_Instances[*].public_dns)
}
output "EC2_out_list" {
  value = zipmap(aws_instance.Ansible_Instances[*].tags_all.Name,aws_instance.Ansible_Instances[*].private_ip)
}
output "EC2_ARN" {
  value = aws_instance.Ansible_Instances[*].arn
}