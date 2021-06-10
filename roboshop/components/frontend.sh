#!/bin/bash

source components/common.sh



HEAD "Installing Nginx\t"
yum install nginx -y &>>/tmp/roboshop.log
STAT $?

