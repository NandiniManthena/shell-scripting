#!/bin/bash

echo -e "\e[1m....................................."
echo -e "Installing Nginx\t"
echo -e "....................................\e[0m"

yum install nginx -y

echo -e "\e[1m....................................."
echo -e "\e[1;32mSuccess\t"
echo -e "....................................\e[0m"

echo -n "Installing Nginx...."
yum install nginx -y &>>/tmp/roboshop.log
echo -e "\e[32mdone\e[0m"






