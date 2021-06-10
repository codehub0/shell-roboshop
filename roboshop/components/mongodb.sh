#!/bin/bash
source components/common.sh
rm -f /tmp/roboshop.log
set-hostname mongodb

HEAD "Installing Mongodb"
HEAD "Setup MongoDB Yum repo file"
echo '[mongodb-org-4.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.2/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.2.asc' >/etc/yum.repos.d/mongodb.repo
STAT $?

HEAD "Install MongoDB\t\t\t"
yum install -y mongodb-org &>>/tmp/roboshop.log
STAT $?

HEAD "Update Listen Address in Config file"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
STAT $?

HEAD "Start MongoDB Service\t\t"
systemctl enable mongod &>>/tmp/roboshop.log
systemctl restart mongod &>>/tmp/roboshop.log
STAT $?
