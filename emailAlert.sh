#!/usr/bin/env bash

# Simple email alert system using Postfix for TX2 Trainning

subject="TX2 OpenCV Haart Training Alert"
message=`tail -n 20 $TX2_LOG`

process=`ps -e | grep opencv`

if [[`wc -l <<< $process` -ne 1]]; then
    mail -s $subject $TX2_ALERT_ACCOUNT <<< $message
fi