#!/bin/bash

# Creating the test folders and the stes file
mkdir ./test_source/

mkdir ./test_source/folder1/
touch ./test_source/folder1/file1_1
touch ./test_source/folder1/file1_2

mkdir ./test_source/folder2/
touch ./test_source/folder2/file2_1
touch ./test_source/folder2/file2_2


mkdir ./test_backup/

# Cleaning up the previous experiment
rm -rf ./test_backup/*