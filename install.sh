#!/usr/bin/env bash

# Installation script

# Configurate email server
echo "Installing mail service..."
sudo apt-get install mailutils

# Set env variabbles
bash ./test.sh 2> /dev/null
res=$?
if [[ $res != 0 ]]; then
    echo "Please install in the repo directory"
    exit $res
fi
echo "export TX2_ALERT_INSTALL_DIR=`pwd`" >> ~/.bashrc
echo "export TX2_ALERT_INSTALL_DIR=`pwd`" >> ~/.alertprofile

read -p "Please enter alert email account: " emailAccount
echo "export TX2_ALERT_ACCOUNT=$emailAccount" >> ~/.bashrc
echo "export TX2_ALERT_ACCOUNT=$emailAccount" >> ~/.alertprofile

read -p "Please select log file (default: /home/nvidia/cascade-classifier/nohup.out): " logFile
logFile=${logFile:-/home/nvidia/cascade-classifier/nohup.out}
echo "export TX2_LOG=$logFile" >> ~/.bashrc
echo "export TX2_LOG=$logFile" >> ~/.alertprofile

source ~/.bashrc

# Test sending
echo "Sending test email..."
mail -s "TX 2 Alert test" $emailAccount <<< "Hello World!"
echo "Successfully sent email, please check your mailbox, especially spam"
echo "Successfully configure email alert system, please run start.sh to initiate alert sequence"