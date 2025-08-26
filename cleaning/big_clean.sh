#!/bin/bash
# Create temp directory to work in
tempdir=$(mktemp -d)
# Extract the tar into the temp directory
tar -xf big_dir.tgz -C $tempdir
# move into temp directory
cd $tempdir
# use find & grep to delete files with "DELETE ME!"
find . -type f -exec grep -q 'DELETE ME!' {} \; -delete

