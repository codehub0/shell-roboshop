#!/bin/bash

HEAD() {
  echo -n -e "\e[1m $1 \e[0m \t\t"
}

STAT() {
 if [$1 -eq 0]; then
 echo -e "\e[1;32m done\e[0m"
 else
 echo -e "\e[1;31 fail\e[0m"
 echo -e "\t \e[1;33m check the log for more details ... logfile: /tmp/roboshop.log[0m"
 exit 1
 fi
}