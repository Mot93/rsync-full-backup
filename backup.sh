#!/bin/bash

bckfolder="${@: -1}"
bcksource="${*: -2:1}"
# Check if the backup destination folder exists and it's a folder
if ! [[ -d "$bckfolder" ]]; then
    echo "Invalid folder to use for the backup"
    echo "$bckfolder"
    exit 1
fi

# Get each optional argument
filesystem=""
unmount=false
exclude=""
while getopts ":f:e:u" options; do

    case "${options}" in
        f)
            #echo "f registered ${OPTARG}"
            filesystem=${OPTARG}
            ;;
        u)
            echo "u registered ${OPTARG}"
            unmount=true
            ;;
        e)
            echo "e registered ${OPTARG}"
            exclude=${OPTARG}
            ;;
        *)
            echo "Invalid argument $OPTARG"
            exit 1
            ;;
    esac

done

# If passed, mount the filesystem
if [ "$filesystem" != "" ]; then
    # If mounting the filesystem fails, exit the script
    if ! sudo mount -t ext4 "$filesystem"  "$bckfolder"; then
        echo "Could not mount the filesystem"
        exit 1
    fi
    echo "mounted"
fi

# TODO: optional what to exclude from the backup

# Execute the backup
if [ "$exclude" = "" ]; then
    echo "rsync -aAXv $bcksource $bckfolder"
    #sudo rsync -aAXv "$bcksource" "$bckfolder"
else
    echo "rsync -aAXv --exclude=$exclude $bcksource $bckfolder"
    #sudo rsync -aAXv --exclude="$exclude" "$bcksource" "$bckfolder"
fi
# If specified, unmount the file system used to store the backup
if [ "$unmount" = true ]; then
    sudo umount "$bckfolder"
    echo "unmounted"
fi

echo "Backup finished"
exit 0