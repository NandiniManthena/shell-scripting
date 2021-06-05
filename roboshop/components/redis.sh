#!/bin/bash

source components/common.sh
rm -f /tmp/roboshop.log

HEAD "set up Redis Repos"
 yum install epel-release yum-utils http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y &>>/tmp/roboshop.log && yum-config-manager --enable remi &>>/tmp/roboshop.log
 STAT $?

HEAD "install redis"
 yum install redis -y &>>/tmp/roboshop.log
 STAT $?

HEAD "update listen address in redis config"
sed -i -e 's/127.0.0.1/0.0.0.0/'/etc/redis.conf
STAT $?

HEAD "start redis service"
 systemctl enable redis &>>/tmp/roboshop.log && systemctl restart redis &>>/tmp/roboshop.log
STAT $?