#!/bin/bash
yum update -y
yum install java-1.8.0 -y
yum install java-1.8.0-openjdk-devel -y
yum install git -y
yum install jq -y
amazon-linux-extras install docker -y
service docker start
usermod -a -G docker ec2-user
cd /home/ec2-user
su -c "wget https://archive.apache.org/dist/kafka/2.2.1/kafka_2.12-2.2.1.tgz" -s /bin/sh ec2-user
su -c "tar -xzf kafka_2.12-2.2.1.tgz" -s /bin/sh ec2-user
su -c "cp /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.282.b08-1.amzn2.0.1.x86_64/jre/lib/security/cacerts /tmp/kafka.client.truststore.jks" -s /bin/sh ec2-user
cd /home/ec2-user/kafka_2.12-2.2.1/bin
su -c "cat <<EOF >>client.properties
security.protocol=SSL
ssl.truststore.location=/tmp/kafka.client.truststore.jks
EOF" -s /bin/sh ec2-user