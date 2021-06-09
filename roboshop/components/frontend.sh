#!/bin/bash
source components/common.sh
rm -f /tmp/roboshop.log

HEAD "Start nginx\t"
yum intall nginx -y &>>/tmp/roboshop.log
STAT $?

HEAD "Download the HTDOC"
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>>/tmp/roboshop.log
STAT $?

HEAD "Delete old html DOCS\t"
rm -rf /usr/share/nginx/html/*
STAT $?

HEAD "Extract & Deploy contents"
unzip -d /usr/share/nginx/html /tmp/frontend.zip &>>/tmp/roboshop.log
mv /usr/share/nginx/frontend-main/* /usr/share/nginx/html/. &>>/tmp/roboshop.log
mv /usr/share/nginx/html/static/* /usr/share/nginx/html/. &>>/tmp/roboshop.log
STAT $?

HEAD "Update nginx configuration"
mv /usr/share/nginx/localhost.conf /etc/nginx/default.d/roboshop.conf
STAT $?

HEAD "start nginx\t\t"
systemctl enable nginx &>>/tmp/roboshop.log && systemctl restart nginx &>>/tmp/roboshop.log
STAT $?

