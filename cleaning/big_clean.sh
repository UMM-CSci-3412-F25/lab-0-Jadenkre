#!/bin/bash
# Trap to make sure temp is cleaned even on failure
trap 'rm -rf "$tempdir"' EXIT
# save path
argpath="$(pwd)/$1"
# Create temp directory
tempdir=$(mktemp -d)
# Extract the tar into the temp directory
tar -xzf "$argpath" -C "$tempdir"
# Move into temp dir
cd $tempdir
# use find & grep to delete files with "DELETE ME!"
find . -type f -print0 | xargs -0 grep -l "DELETE ME!" | xargs rm -f
# return to previous directory
cd ..
# create new archive
newdir="cleaned_$1"
tar -czf "$newdir" -C "$tempdir"
