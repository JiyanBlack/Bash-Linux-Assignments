#!/bin/bash
#tested on linux ubuntu
# Yan Ji 21824073
# input: 
#first parameter - sorted by which column
#second parameter - filename
#Third parameter[optional] - add options to sort

# example:
# ./Q2_SortExHead.sh 2 state-populations.txt n
# The example will sort the file according to the second column's numeric value excluding head part.

head -n 1 "${2}"
tail -n +2 "${2}" | sort -k "${1}""${3}"
exit 0
