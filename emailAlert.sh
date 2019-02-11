#!/usr/bin/env bash

# Simple email alert system using Postfix for TX2 Trainning

# Set env variables
source ~/.bashrc

subject="TX2 OpenCV Haart Training Alert"
message=`tail -n 20 $TX2_LOG`

process=`ps -e | grep opencv`

# Compare word count
if ((`wc -w <<< $process` == 0)); then
    echo "Alert!!!"
    echo $message
    mail -s "$subject" $TX2_ALERT_ACCOUNT <<< $message
fi