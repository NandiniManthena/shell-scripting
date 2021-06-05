#!/bin/bash

source components/common.sh
rm -f /tmp/roboshop.log

HEAD "Installing NodeJS"
 yum install nodejs make gcc-c++ -y &>>/tmp/roboshop.log
 STAT $?

HEAD "ADD Roboshop App USer"
id roboshop &>>/tmp/roboshop.log
if [ $? -eq 0 ]; then
  echo user is already thereso skippion &>>/tmp/roboshop.log
  STAT $?
else
  useradd roboshop &>>/tmp/roboshop.log
  STAT $?
fi

HEAD "Download curl from Git"
curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip"&>>/tmp/roboshop.log
STAT $?

HEAD "Extract the downloaded archive"
cd /home/roboshop && rm -rf catalogue && unzip /tmp/catalogue.zip &>>/tmp/roboshop.log && mv catalogue-main catalogue
STAT $?

HEAD "Install nodejs dependencies"
cd /home/roboshop/catalogue && npm install --unsafe-perm &>>/tmp/roboshop.log
STAT $?

HEAD "'Fix Permissions to App content"
chown roboshop:roboshop /home/roboshop -R
STAT $?

HEAD "setup SYSTEMD service"
sed -i -e 's/MONGO_DNSNAME/mongodb.roboshop.internal/' /home/roboshop/catalogue/systemd.service
&& mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
STAT $?

HEAD "Start catalogue service"
systemctl daemon-reload && systemctl enable catalogue &>>/tmp/roboshop.log && systemctl restart catalogue &>>/tmp/roboshop.log
STAT $?






