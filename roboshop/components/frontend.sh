#!/bin/bash

echo -e "\e[1m....................................."
echo -e "Installing Nginx\t"
echo -e "....................................\e[0m"

yum install nginx -y &>>/tmp/roboshop.log


