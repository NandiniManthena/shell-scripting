#!/bin/bash

source components/common.sh
rm -f /tmp/roboshop.log

HEAD "Installing NodeJS"
 yum install nodejs make gcc-c++ -y &>>/tmp/roboshop.log
 STAT $?

HEAD "ADD Roboshop App USer"
useradd roboshop &>>/tmp/roboshop.log
STAT $?

HEAD "Download curl from Git"
curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip"&>>/tmp/roboshop.log
STAT $?

HEAD "Extract the downloaded archive"
cd /home/roboshop && unzip /tmp/catalogue.zip &>>/tmp/roboshop.log && mv catalogue-main catalogue
STAT $?

HEAD "Install nodejs dependencies"
cd /home/roboshop/catalogue && npm install &>>/tmp/roboshop.log
STAT $?



