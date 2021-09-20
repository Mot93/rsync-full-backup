# rsync_full_backup
A small bash script to perform a full backup of your linux system

    backup.sh [OPTIONS] <origin> <destination>

Suggested exclude:

    '{"/proc/*","/tmp/*","/run/*","/mnt/*","/media/*"}'

Excluding a single file/folder:

    "/mnt/*"