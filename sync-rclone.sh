#!/bin/sh
#
# Wrapper for rclone calls 
# Specialized for OneDrive usage

SYNC_FOLDER="/app/drive/"

rclone sync --ignore-size -v --multi-thread-streams 0 --exclude '/Coffre-fort/**' $SYNC_USER:/ $SYNC_FOLDER
