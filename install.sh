#!/usr/bin/env bash

# Installation script

# Configurate email server
echo "Installing mail service..."
sudo apt-get install mailutils

# Set env variabbles
read -p "Please enter alert email account: " emailAccount
echo "export TX2_ALERT_ACCOUNT=$emailAccount" >> ~/.bashrc

read -p "Please select log file (default: /home/nvidia/cascade-classifier/nohup.out): " logFile
echo "export TX2_LOG=$logFile" >> ~/.bashrc

# Test sending
echo "Sending test email..."
mail -s "TX 2 Alert test" $emailAccount <<< "Hello World!"
echo "Successfully sent email, please check your mailbox, especially spam"
echo "Successfully configure email alert system, please run start.sh to initiate alert sequence"