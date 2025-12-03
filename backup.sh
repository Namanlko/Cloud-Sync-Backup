#!/bin/bash

: <<'INFO'
This Shell script will take periodic backups.
Usage: ./backup.sh <Source> <Destination>
INFO

src=$1
dest=$2
timestamp=$(date '+%Y-%m-%d-%H-%M')

zip -r "$dest/backup-$timestamp.zip" "$src"

echo "Backup Completed!!"