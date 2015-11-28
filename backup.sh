#!/bin/bash
source config.cfg

# Connect to wifi if connection dropped
if ifconfig wlan0 | grep -q "inet addr:" ; then
	#do nothing
	echo "internet connected"
else
	ifup --force wlan0
fi

# Mount drive if not mounted
sudo mount /mnt/$drive_name > /dev/null 2>&1

# Copy all new or changed files
cp -r -u /mnt/$drive_name/* $backup_path/
