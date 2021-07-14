# terraform_produce_consumer_instance
sudo adduser {username}
sudo passwd --expire {username}
sudo passwd -l {username}
sudo passwd -u {username}
userdel -r {username}
sudo useradd -p $(openssl passwd -1 {password}) {username}

---------------

ssh-keygen
copy id_rsa.pub key to slave /home/ec2-user/.ssh/authorized_keys

Add slave Private IP in file /etc/ansible/hosts
Add below line under [defaults] in /etc/ansible/ansible.cfg on master
interpreter_python = auto_silent
ansible -m ping all

ansible Slaves -a "/sbin/reboot" -f 10 -u ec2-user
ansible Slaves -m copy -a "src = /home/ec2-user/sampledata dest = /home/ec2-user/sampledata"

ansible-playbook 
{{ ansible_local['message']['general']['slave2_message'] }}