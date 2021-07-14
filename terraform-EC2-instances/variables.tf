variable "vpc_id" {}
variable "instance_type" {}
variable "instance_name" {}
variable "key_name" {}
variable "key_public_path" {
  sensitive = true
}
locals {
  subnet_ids = tolist(data.aws_subnet_ids.subnet_ids.ids)
}
variable "userdata_path" {}
variable "SG_Name" {}
variable "Ingress_list" {}
variable "Egress_list" {}
variable "instance_cat" {}