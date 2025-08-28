#!/bin/bash
# Trap to make sure temp is cleaned even on failure
trap 'rm -rf "$tempdir"' EXIT
# save path
argpath="$(pwd)/$1"
# Create temp directory
tempdir=$(mktemp -d)
# Extract the tar into the temp directory
tar -xzf "$argpath" -C "$tempdir"
# move to temp
cd "$tempdir" || exit
# use find & grep to delete files with "DELETE ME! 
find "$tempdir" -type f -print0 | xargs -0 grep -l "DELETE ME!" | xargs rm -f
# move back to original directory
cd - || exit
# creating the new name for the archive
newdir="cleaned_$(basename "$1")"
# creating the new archive
tar -czf "$newdir" -C "$tempdir" "$(ls -A "$tempdir")"
