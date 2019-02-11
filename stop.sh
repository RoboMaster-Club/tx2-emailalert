#!/usr/bin/env bash

# Remove alert schedule
crontab -l >> previousCrontab
touch tmp
crontab tmp
rm tmp