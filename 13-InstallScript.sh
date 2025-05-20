#!/bin/bash
USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have sudo access to execute this script"
    exit 1 #other than 0
fi
dnf list install mysql
if [ $? -ne 0 ]
then
    echo "Allowed to install Mysql"
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "Mysql Instalation Failed"
        exit 1
    else
        echo "Mysql Instalation success"
    if
else
    echo "Mysql Already Installed"
if
    
