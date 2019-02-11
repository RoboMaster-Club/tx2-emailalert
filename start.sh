#!/usr/bin/env bash

# Add alert to scheduler

# Remove previous schedule
bash ./stop.sh

# Add to scheduler
crontab -l > tmp
echo "# Used by TX2 Email Alert #" >> tmp
echo "00 * * * * bash ./emailAlert.sh" >> tmp
crontab tmp
rm tmp