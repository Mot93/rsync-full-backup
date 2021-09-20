# rsync_full_backup
A small bash script to perform a full backup of your linux system

    backup.sh <origin> <destination> [OPTIONS]

Suggested exclude:

    {"/proc/*","/tmp/*","/run/*","/mnt/*","/media/*"}

Excluding a single file/folder:

    "/mnt/*"