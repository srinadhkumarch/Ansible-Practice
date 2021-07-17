#!/bin/bash
yum update -y
# amazon-linux-extras install ansible2 -y
yum install java-1.8.0 -y
yum install java-1.8.0-openjdk-devel -y
yum install git -y
yum install jq -y
amazon-linux-extras install docker -y
service docker start
export PASSWD=Indi@123
sudo useradd -p $(openssl passwd -1 $PASSWD) ansible
echo "ansible ALL=(ALL)   NOPASSWD:ALL" >> /etc/sudoers
# sudo sed –i ‘/PasswordAuthentication yes/s/^#//’ /etc/ssh/sshd_config
# sudo sed –i “s/PasswordAuthentication no/#PasswordAuthentication no/g” /etc/ssh/sshd_config
sudo usermod -aG root ansible
sudo service sshd restart 
# su -c "echo 'export PS1="${var.instance_cat} [\u@\h \W]$ "' >> /home/ec2-user/.bash_profile" -s /bin/sh ec2-user
su -c "pip3 install ansible --user ansible"  -s /bin/sh ansible
mkdir /etc/ansible && cd /etc/ansible
curl -O https://raw.githubusercontent.com/ansible/ansible/devel/examples/hosts
curl -O https://raw.githubusercontent.com/ansible/ansible/devel/examples/ansible.cfg
su -c "pip3 install ansible-lint --user ansible" -s /bin/sh ansible
export PATH="$PATH:/home/ansible/.local/bin"
su -c "cd /home/ansible && mkdir .ssh" -s /bin/sh ansible
su -c "cd /home/ansible/.ssh && touch authorized_keys" -s /bin/sh ansible
su -c "chmod 600 authorized_keys " -s /bin/sh ansible
