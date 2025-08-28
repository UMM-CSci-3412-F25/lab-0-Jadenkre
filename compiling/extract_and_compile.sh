#!/bin/bash
# extract the NthPrime.tgz
tar -xzf NthPrime.tgz
# move to the folder we extracted
cd NthPrime/ || exit
# compile the c files using gcc
OUTPUT="NthPrime"
gcc main.c nth_prime.c -o $OUTPUT
# Grab number from args
n=$1
# run the resulting exe
./$OUTPUT "$n"

