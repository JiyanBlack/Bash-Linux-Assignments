#!/bin/bash
#tested on linux ubuntu
# Yan Ji 21824073
# No parameter need to provide.


NewSouthWales=()
NewSouthWales_max=0
Victoria=()
Victoria_max=0
Queensland=()
Queensland_max=0
WesternAustralia=()
WesternAustralia_max=0
SouthAustralia=()
SouthAustralia_max=0
Tasmania=()
Tasmania_max=0
NorthernTerritory=()
NorthernTerritory_max=0
CapitalTerritory=()
CapitalTerritory_max=0;
IFS=","

while read -r line
do
    read -ra singleLine <<< "${line}"
    this_name="${singleLine[0]}"
    NewSouthWales["${#NewSouthWales[@]}"]=$this_name
    this_max=$(echo "(${singleLine[4]}+${singleLine[5]})/${singleLine[6]}" | bc -l)
    NewSouthWales["${#NewSouthWales[@]}"]=${this_max}
    if [[ $this_max > $NewSouthWales_max ]]; then
        NewSouthWales_max_name=$this_name
        NewSouthWales_max=$this_max
    fi
done < <(cat university-enrolments-2015.csv | head -n 13 |tail -n 11)
# echo ${NewSouthWales[@]}
echo "New South Wales: ${NewSouthWales_max_name} has the highest oversea students ratio: ${NewSouthWales_max}."

while read -r line
do
    read -ra singleLine <<< "${line}"
    this_name="${singleLine[0]}"
    Victoria["${#Victoria[@]}"]=$this_name
    this_max=$(echo "(${singleLine[4]}+${singleLine[5]})/${singleLine[6]}" | bc -l)
    Victoria["${#Victoria[@]}"]=${this_max}
    if [[ $this_max > $Victoria_max ]]; then
        Victoria_max_name=$this_name
        Victoria_max=$this_max
    fi
done < <(cat university-enrolments-2015.csv | head -n 24 |tail -n 10)
# echo ${Victoria[@]}
echo "Victoria: ${Victoria_max_name} has the highest oversea students ratio: ${Victoria_max}."

while read -r line
do
    read -ra singleLine <<< "${line}"
    this_name="${singleLine[0]}"
    Queensland["${#Queensland[@]}"]=$this_name
    this_max=$(echo "(${singleLine[4]}+${singleLine[5]})/${singleLine[6]}" | bc -l)
    Queensland["${#Queensland[@]}"]=${this_max}
    if [[ $this_max > $Queensland_max ]]; then
        Queensland_max_name=$this_name
        Queensland_max=$this_max
    fi
done < <(cat university-enrolments-2015.csv | head -n 34 |tail -n 9)
# echo ${Queensland[@]}
echo "Queensland: ${Queensland_max_name} has the highest oversea students ratio: ${Queensland_max}."

while read -r line
do
    read -ra singleLine <<< "${line}"
    this_name="${singleLine[0]}"
    WesternAustralia["${#WesternAustralia[@]}"]=$this_name
    this_max=$(echo "(${singleLine[4]}+${singleLine[5]})/${singleLine[6]}" | bc -l)
    WesternAustralia["${#WesternAustralia[@]}"]=${this_max}
    if [[ $this_max > $WesternAustralia_max ]]; then
        WesternAustralia_max_name=$this_name
        WesternAustralia_max=$this_max
    fi
done < <(cat university-enrolments-2015.csv | head -n 41 |tail -n 6)
# echo ${WesternAustralia[@]}
echo "Western Australia: ${WesternAustralia_max_name} has the highest oversea students ratio: ${WesternAustralia_max}."

while read -r line
do
    read -ra singleLine <<< "${line}"
    this_name="${singleLine[0]}"
    SouthAustralia["${#SouthAustralia[@]}"]=$this_name
    this_max=$(echo "(${singleLine[4]}+${singleLine[5]})/${singleLine[6]}" | bc -l)
    SouthAustralia["${#SouthAustralia[@]}"]=${this_max}
    if [[ $this_max > $SouthAustralia_max ]]; then
        SouthAustralia_max_name=$this_name
        SouthAustralia_max=$this_max
    fi
done < <(cat university-enrolments-2015.csv | head -n 46 |tail -n 4)
# echo ${SouthAustralia[@]}
echo "South Australia: ${SouthAustralia_max_name} has the highest oversea students ratio: ${SouthAustralia_max}."

while read -r line
do
    read -ra singleLine <<< "${line}"
    this_name="${singleLine[0]}"
    NorthernTerritory["${#NorthernTerritory[@]}"]=$this_name
    this_max=$(echo "(${singleLine[4]}+${singleLine[5]})/${singleLine[6]}" | bc -l)
    NorthernTerritory["${#NorthernTerritory[@]}"]=${this_max}
    if [[ $this_max > $NorthernTerritory_max ]]; then
        NorthernTerritory_max_name=$this_name
        NorthernTerritory_max=$this_max
    fi
done < <(cat university-enrolments-2015.csv | head -n 49 |tail -n 2)
# echo ${NorthernTerritory[@]}
echo "Northen Territory: ${NorthernTerritory_max_name} has the highest oversea students ratio: ${NorthernTerritory_max}."

while read -r line
do
    read -ra singleLine <<< "${line}"
    this_name="${singleLine[0]}"
    CapitalTerritory["${#CapitalTerritory[@]}"]=$this_name
    this_max=$(echo "(${singleLine[4]}+${singleLine[5]})/${singleLine[6]}" | bc -l)
    CapitalTerritory["${#CapitalTerritory[@]}"]=${this_max}
    if [[ $this_max > $CapitalTerritory_max ]]; then
        CapitalTerritory_max_name=$this_name
        CapitalTerritory_max=$this_max
    fi
done < <(cat university-enrolments-2015.csv | head -n 55 |tail -n 2)
# echo ${CapitalTerritory[@]}
echo "Australian Capital Territory: ${CapitalTerritory_max_name} has the highest oversea students ratio: ${CapitalTerritory_max}."

echo "Highest oversea students ratio of all is Non-University Higher Education Institutions in Western Australia: .74475262368815592203"
