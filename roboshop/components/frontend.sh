#!/bin/bash

source components/common.sh
rm -f /tmp/roboshop.log

HEAD "Installing Nginx...."
yum install nginx -y &>>/tmp/roboshop.log
STAT $?

HEAD "Start Nginx"
systemctl restart nginx &>>/tmp/roboshop.log
systemctl enable nginx &>>/tmp/roboshop.log
STAT $?









