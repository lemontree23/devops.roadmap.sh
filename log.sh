#!/bin/bash

FILE=$1

#top IP
printf "Top 5 IP addresses with the most requests:\n"
awk '{print $1}' $FILE | sort | uniq -c | sort -r | head -n5 | sed 's/^ *//' | awk -F" " '{print $2 " - " $1 " requests"}'
printf "\n"

printf "Top 5 most requested paths:\n"
awk '{print $7}' $FILE | sort | uniq -c | sort -r | head -n5 | sed 's/^ *//' | awk -F" " '{print $2 " - " $1 " requests"}'
printf "\n"

printf "Top 5 response status codes:\n"
awk '{print $9}' log.txt | sort | uniq -c | sort -r | head -n5 | sed 's/^ *//' | awk -F" " '{print $2 " - " $1 " requests"}'
printf "\n"
