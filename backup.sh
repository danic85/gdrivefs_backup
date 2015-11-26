#!/bin/bash
source config.cfg

sudo mount $drive_name

cp -r -u /mnt/$drive_name $backup_path
