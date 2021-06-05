HEAD(){
    echo -n -e "\e[1m $1 \e[0m \t\t\t..."
}

STAT(){
  if [ $1 -eq 0 ]; then
    echo -e "\e[1;32m done\e[0m"
  else
  echo -e "\e[1;31m failed\e[0m"
  echo -e "\e[1;33m check the log file : /tmp/roboshop.log\e[0m"
  exit 1
  fi
}

APP_USER_ADD(){
  HEAD "ADD Roboshop App USer"
id roboshop &>>/tmp/roboshop.log
if [ $? -eq 0 ]; then
  echo user is already thereso skippion &>>/tmp/roboshop.log
  STAT $?
else
  useradd roboshop &>>/tmp/roboshop.log
  STAT $?
fi
}

NODEJS(){
  HEAD "Installing NodeJS"
 yum install nodejs make gcc-c++ -y &>>/tmp/roboshop.log
 STAT $?

APP_USER_ADD

HEAD "Download curl from Git"
curl -s -L -o /tmp/$1.zip "https://github.com/roboshop-devops-project/$1/archive/main.zip"&>>/tmp/roboshop.log
STAT $?

HEAD "Extract the downloaded archive"
cd /home/roboshop && rm -rf $1 && unzip /tmp/$1.zip &>>/tmp/roboshop.log && mv $1-main $1
STAT $?

HEAD "Install nodejs dependencies"
cd /home/roboshop/$1 && npm install --unsafe-perm &>>/tmp/roboshop.log
STAT $?

HEAD "'Fix Permissions to App content"
chown roboshop:roboshop /home/roboshop -R
STAT $?

HEAD "setup SYSTEMD service"
sed -i -e 's/MONGO_DNSNAME/mongodb.roboshop.internal/' /home/roboshop/$1/systemd.service && mv /home/roboshop/$1/systemd.service /etc/systemd/system/$1.service
STAT $?

HEAD "Start $1 service"
systemctl daemon-reload && systemctl enable $1 &>>/tmp/roboshop.log && systemctl restart $1 &>>/tmp/roboshop.log
STAT $?

}