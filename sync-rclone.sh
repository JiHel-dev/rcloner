#!/bin/bash
#
# Wrapper for rclone calls 
# Specialized for OneDrive usage

SYNC_USER="rcloned"
SYNC_FOLDER="/path/to/rclone/folder/"

rclone sync --ignore-size -v --multi-thread-streams 0 $SYNC_USER:/ $SYNC_FOLDER

