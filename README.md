# What it does  
This is a daemon for rclone sync and it manages multiple configurations.
You will create one docker container for each drive you want to synchronize.
Thanks to docker starting management, you will be able to select your synchronization rate.

# Requirements  

You just need to install :
- docker
- docker compose (whichever version)
- make

# Setup  

Please follow this process to build, configure and install ratiomaster into your target :
- `make configure`  
  Follow interactive CLI to setup your drive configurations
- `SYNC_DIR=/path/to/sync/dir/ make install`  
  Select a drive configuration thanks to interactive CLI and create a container  
  Repeat this step for each drive configuration
- `docker start rcloner_${drive_configuration}`  
  Run docker for each drive configuration

Optionnally you can schedule an auto restart with  
`docker update --restart unless-stopped rcloner_${drive_configuration}`


**Note** : Don't select the same sync directory for all drive configuration, you will have conflicts.

# Limitations

Rclone configuration file is hardcoded to be stored into `~/.config/rclone/`
