#!/bin/bash 

./setup.sh

./backup.sh -e "{'folder2/*','folder1/file1_1'}" ./test_source/ ./test_backup/

# test1 has to be copied
if [[ -d "./test_backup_folder/test1" ]]; then
    echo "SUCCESS folder1 copied"
else
    echo "FAILED folder1 not copied"
fi

# test2 shound't be copied
if [[ -d "./test_backup_folder/test2" ]]; then
    echo "FAILED folder2 copied"
else 
    echo "SUCCESS folder2 not copied"
fi

exit 0
