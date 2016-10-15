#!/bin/bash
#tested on linux ubuntu
# Yan Ji 21824073
# No parameter need to provide.
# reference: http://stackoverflow.com/questions/10586153/split-string-into-an-array-in-bash
#            http://stackoverflow.com/questions/11145270/bash-replace-an-entire-line-in-a-text-file

projectName=`grep -l main *.c | sed "s/\.c//g"`
IFS=',' read -r -a array <<< `grep -l version *.c | tr "\n" ","`
date=`date "+%a %b %d %H:%M:%S %Z %Y"`
echo "Find main function location: $projectName.c"
echo "Project Name is: $projectName"
echo "Find version info in the following files:"
echo ${array[@]}
for file in "${array[@]}"
do
    targetLine=`grep -n version $file | head -c 4 | grep -o '^[0-9]*'`
    versionNumber=`grep -o 'version\s[0-9]*' $file | grep -o '[0-9]*'`
    versionNumber=$(($versionNumber+1))
    versionInfo="// $projectName, version $versionNumber, released $date"
    head=`head -n $(($targetLine-1)) $file`
    tail=`tail -n +$(($targetLine+1)) $file`
    printf "%s\n\n%s\n%s" "$head" "$versionInfo" "$tail" > $file
done
echo
echo "Updating version succeed!"
