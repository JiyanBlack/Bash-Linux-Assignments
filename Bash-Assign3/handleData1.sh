#!/bin/bash
# module for handle wanted result sorted by timestamp for Q1

sort -t"	" -k 1n wificapture-1.txt | awk -F"	" '{print $1,"\t",$(NF-2),"\t",$(NF-1)}' 

