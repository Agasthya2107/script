#!/bin/bash
USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have sudo access to execute this script"
    exit 1 #other than 0
fi
dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "Allowed to install Mysql"
    dnf install mysqll -y
    if [ $? -ne 0 ]
    then
        echo "Mysql Instalation Failed"
        exit 1
    else
        echo "Mysql Instalation success"
    fi
else
    echo "MySQL is already ... INSTALLED"
fi
dnf list installed git

if [ $? -ne 0 ]
then 
    echo "User Allowed to install GIT"
    dnf install git -y
    if [ $? -ne 0 ]
    then
       echo "Git Not Installed"
       exit 1
    else 
        echo "Git installed perfectly"
    fi
else
    echo "GIT already Installed"
fi