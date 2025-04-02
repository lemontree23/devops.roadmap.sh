#!/bin/bash

if [ -n "$1" ]; then
  FILE=$1
else
  FILE="log.txt"
fi

COUNT=5

#top IP
printf "Top 5 IP addresses with the most requests:\n"
awk '{print $1}' $FILE | sort | uniq -c | sort -nr | head -n${COUNT} | awk -F" " '{print $2 " - " $1 " requests"}'
printf "\n"

printf "Top 5 most requested paths:\n"
awk '{print $7}' $FILE | sort | uniq -c | sort -nr | head -n${COUNT} | awk -F" " '{print $2 " - " $1 " requests"}'
printf "\n"

printf "Top 5 response status codes:\n"
awk '{print $9}' $FILE | sort | uniq -c | sort -nr | head -n${COUNT} | awk -F" " '{print $2 " - " $1 " requests"}'
printf "\n"
