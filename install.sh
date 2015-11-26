#!/bin/bash

echo "######################### Installing gdrivefs_backup ########################"

cd ~

# Update apt-get
sudo apt-mark hold raspberrypi-bootloader # hold bootloader (required for waveshare LCD screen)
sudo apt-get update
sudo apt-get upgrade

# Install python pip
sudo apt-get install python-pip

# Output authentication URL
gdfstool auth -u

echo "Paste the above URL into your browser and enter the returned key. You must be logged in to your Google account first!"

read key

# Store credentials
gdfstool auth -a $current_path/gdfs.creds "$key"

# Make mount
sudo mkdir /mnt/$drive_name
sudo gdfs -o allow_other $current_path/gdfs.creds /mnt/$drive_name
ls /mnt/$drive_name

sudo ln -s /usr/local/bin/gdfs /sbin/mount.gdfs

# Backup fstab
sudo cp /etc/fstab /etc/fstab.bak

# Add drive to fstab
echo "$current_path/gdfs.creds /mnt/$drive_name gdfs allow_other 0 0" >> /etc/fstab

# Make backup directory
mkdir $backup_path

# Backup crontab
sudo cp /etc/crontab /etc/crontab.bak

# Add nightly backup to crontab
echo "0 0 * * * .$current_path/backup.sh" >> /etc/crontab
/etc/init.d/cron restart

echo "Installation Complete"
