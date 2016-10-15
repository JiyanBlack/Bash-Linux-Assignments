#!/bin/bash
#tested on linux ubuntu
# Yan Ji 21824073
# Provide the file name as the sole parameter

tr " " "\n" < "${1}" | sed 's/[^A-Za-z0-9]//g' | sort | uniq
