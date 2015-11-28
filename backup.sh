#!/bin/bash
source config.cfg

sudo mount /mnt/$drive_name > /dev/null 2>&1

cp -r -u /mnt/$drive_name/* $backup_path/
