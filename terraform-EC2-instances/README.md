# terraform_produce_consumer_instance
sudo adduser {username}
sudo passwd --expire {username}
sudo passwd -l {username}
sudo passwd -u {username}
userdel -r {username}
sudo useradd -p $(openssl passwd -1 {password}) {username}