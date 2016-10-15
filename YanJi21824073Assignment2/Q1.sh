#!/bin/bash
#tested on linux ubuntu
# Yan Ji 21824073
# Provide the file name as the sole parameter

comm -23 <(tr " " "\n" < "${1}" | sed "s/[^A-Za-z\']//g" | sed 's/.{1,3}//g' | tr A-Z a-z | sort | uniq) <(sort linux.words)
