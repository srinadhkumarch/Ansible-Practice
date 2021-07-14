!#/bin/bash

cd /home/ec2-user

Directory_name=/home/ec2-user/master_folder
if [ -d "$Directory_name" ]; then
    echo "$Directory_name is a directory."
else
    mkdir master_folder && cd master_folder
    FILE=config.txt
    if [ -f "$FILE" ]; then
        echo "$FILE exists."
    else 
        echo "Welcome to master" > config.txt
    fi
fi
