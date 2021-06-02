#!/bin/bash

source components/common.sh

HEAD "Installing Nginx...."
yum install nginxoii -y &>>/tmp/roboshop.log
STAT $?








