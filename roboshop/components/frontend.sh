#!/bin/bash

source components/common.sh

HEAD "Installing Nginx\t"
yum install nginx -y &>>/tmp/roboshop.log
echo -e -n "e\e[32m Done\e[0m"

