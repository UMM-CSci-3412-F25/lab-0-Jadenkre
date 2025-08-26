#!/bin/bash
# Create temp directory to work in
tempdir=$(mktemp -d)
# Extract the tar into the temp directory
tar -xf big_dir.tgz -C $tempdir

