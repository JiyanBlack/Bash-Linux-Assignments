#!/bin/bash
#tested on linux ubuntu
# Yan Ji 21824073
# Good weather criteria:
# 1.Minimum Temperature >= 5
# 2.Maximum Temperature <= 30
# 3.Rainfall <= 5
# This program needs no parameter.
# References:
# http://stackoverflow.com/questions/11393817/bash-read-lines-in-file-into-an-array
# http://www.thegeekstuff.com/2010/06/bash-array-tutorial

array=()
IFS=","

# append date,miniTemp,Maxtemp and rainfall to $array variable
while read -r line
do
    read -ra singleLine <<< "${line}"
    array["${#array[@]}"]=$(cut -d"-" -f3 <<< "${singleLine[1]}")
    array["${#array[@]}"]="${singleLine[2]}"
    array["${#array[@]}"]="${singleLine[3]}"
    array["${#array[@]}"]="${singleLine[4]}"
done < <(cat IDCJDW6111.201607.csv | tail -n +10)
# echo ${array[@]}

# iterate over array and do calculations
goodWeekday=0
goodWeekend=0
numWeekday=0
numWeekend=0
length="${#array[@]}"
for ((i=0;i<"$length";i++))
do
    if [[ $(($i % 4)) == 0 ]]; then
        if [[ $((${array[$i]}%7)) != 2 ]] && [[ $((${array[$i]}%7)) != 3 ]]
        then
            ((numWeekday=numWeekday+1))
            if [[ ${array[$(($i+1))]} >=5 ]] && [[ ${array[$(($i+2))]} <=30 ]] && [[ ${array[$(($i+3))]} <=5 ]]
            then
                ((goodWeekday=goodWeekday+1))
            fi
        else
            ((numWeekend=numWeekend+1))
            if [[ ${array[$(($i+1))]} >=5 ]] && [[ ${array[$(($i+2))]} <=30 ]] && [[ ${array[$(($i+3))]} <=5 ]]
            then
                ((goodWeekend=goodWeekend+1))
            fi
        fi
    fi
done
echo "Here is the statistic result:"
echo "Total weekdays number: ${numWeekday}, good weekdays number: ${goodWeekday}"
echo "While we have ${numWeekend} weekends, good weekends number: ${goodWeekend}"
echo "So the rumor is not true!"
