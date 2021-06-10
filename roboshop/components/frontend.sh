#!/bin/bash

source components/common.sh
rm -f /tmp/roboshop.log

HEAD "Installing Nginx\t"
yum install nginx -y &>>/tmp/roboshop.log
STAT $?

