#!/bin/bash
## Declare a variable
NAME=NANDINI

##Aceess a variable
echo MY NAME = $NAME

##DATE
DATE=$(date +%F)
echo "Hey Nandu, today is $DATE"

NO_OF_USERS=$(who | wc -l)
echo "Number of users logged in the system $NO_OF_USERS"

ADD=$((2+4+5))
BIG=$((10+2+50))
echo ADD=$ADD
echo BIG=$BIG




