#!/bin/bash
# module for handle wanted result sorted by timestamp

awk '{print $4,"\t",$(NF-1),"\t",$(NF)}' $1 > data2.tmp

sed 's/^.//' data2.tmp
