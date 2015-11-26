## gdrivefs_backup
Installation and scheduled backup for gdrivefs on raspberry pi

## Installation
* Copy files to /home/pi/gdrivefs_backup
* ./home/pi/gdrivefs_backup/install.sh

## Usage
* Cron job will be scheduled to execute a 1-way backup every night at midnight. This will copy uploaded files to the directory specified in config.cfg.

## Credit
* Script created by Dan Nicholson (github.com/danic85)
* Based on https://www.raspberrypi.org/forums/viewtopic.php?f=29&t=109587
