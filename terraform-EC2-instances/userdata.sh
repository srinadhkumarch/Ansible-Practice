#!/bin/bash
yum update -y
amazon-linux-extras install ansible2 -y
yum install java-1.8.0 -y
yum install java-1.8.0-openjdk-devel -y
yum install git -y
yum install jq -y
amazon-linux-extras install docker -y
service docker start
export PASSWD=Indi@123
sudo useradd -p $(openssl passwd -1 $PASSWD) ansible2
echo "ansible ALL=(ALL)   NOPASSWD:ALL" >> /etc/sudoers
# sudo sed –i ‘/PasswordAuthentication yes/s/^#//’ /etc/ssh/sshd_config
# sudo sed –i “s/PasswordAuthentication no/#PasswordAuthentication no/g” /etc/ssh/sshd_config
sudo service sshd restart 
# usermod -a -G docker ec2-user
# su -c "echo 'export PS1="${var.instance_cat} [\u@\h \W]$ "' >> /home/ec2-user/.bash_profile" -s /bin/sh ec2-user