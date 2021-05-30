#!/bin/bash
## Declare a variable
NAME=NANDINI

##Aceess a variable
echo MY NAME = $NAME

##DATE
DATE=$(date +%F)
echo "Hey Nandu, today is $DATE"

NO_OF_USERS=$(who | wc -1)
echo "Number of users logged in the system $NO_OF_USERS"



