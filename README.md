# rsync_full_backup
A small bash script to perform a full backup of your linux system using the rsync tool

## Requirements

The only requirement is that `rsync` is installed

## Use

    backup.sh [OPTIONS] <origin> <destination>

## Options

    origin              The folder to backup
    destination         The folder where to store the backup

    -f <filesystem>     The filesystem to mount                  
    -u                  Unmount the filesystem after the backup
    -e <folder/files>   Folders and files to exclude

Suggested exclude:

    "{'/proc/*','/tmp/*','/run/*','/mnt/*','/media/*'}"

## Testing

The files `setup.sh` and `test.sh` are setup to test the script.

Launch `test.sh` to launch the test.