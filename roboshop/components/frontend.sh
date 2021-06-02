#!/bin/bash

source components/common.sh
rm -f /tmp/roboshop.log

HEAD "Installing Nginx...."
yum install nginxx -y &>>/tmp/roboshop.log
STAT $?









