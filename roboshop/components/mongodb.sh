#!/bin/bash

source components/common.sh
rm -f /tmp/roboshop.sh

HEAD "SetUp Mongodb yum repo file"
echo '[mongodb-org-4.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.2/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.2.asc' >/etc/yum.repos.d/mongodb.repo
STAT $?

HEAD "Install Mongodb\t"
yum install -y mongodb-org &>>/tmp/roboshop.sh
STAT $?

HEAD "Start MongoDB Service\t\t"
systemctl enable mongod &>>/tmp/roboshop.log
systemctl restart mongod &>>/tmp/roboshop.log
STAT $?



