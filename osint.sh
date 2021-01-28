#!/bin/bash
clear
trap ctrl_c INT
ctrl_c(){ echo "ExIt :)"; exit; }
figlet osint
echo -en "number \e[32m?\e[0m "
read num
api="http://apilayer.net/api/validate?access_key=5a4f0b9f6e3e184efc9aaf367d43441e&number=$num&country_code=&format=1"
curl $api -o output.json > /dev/null 2>&1
cat output.json | tr '""{},' " " >> info-$num.txt
int=$(cat info-$num.txt | grep 'international_format') 
cnp=$(cat info-$num.txt | grep 'country_prefix')
cnc=$(cat info-$num.txt | grep 'country_code') 
cnn=$(cat info-$num.txt | grep 'country_name')

lcn=$(cat info-$num.txt | grep 'location')
crr=$(cat info-$num.txt | grep 'carrier')
echo -e "$int\e[0m"
echo -e "$cnp\e[0m"
echo -e "$cnc\e[0m"
echo -e "$cnn\e[0m"
echo -e "$lcn\e[0m"
echo -e "$crr\e[0m"
rm output.json *.txt

