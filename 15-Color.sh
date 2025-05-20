#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"

VALIDATE()
{
    if [ $1 -ne 0 ]
    then
        echo -e "$2 not $R installed"
        exit 1
    else
        echo -e "$2 $G Deployed properly"
    fi
}

if [ $USERID -ne 0 ]
then 
    echo "Run the application with super user access"
    exit 1
fi
dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo "Allowed to install MYSQL"
    dnf install mysql -y
    VALIDATE $? "MY SQL"
else
    echo -e "$Y MYSQL Software already installed in this VM"
fi
 dnf list installed git 

if [ $? -ne 0 ]
then
    echo "Allowed to instsall git"
    dnf install git -y
    VALIDATE $? "GIT PACKAGE"
else 
    echo -e " $Y GIT Software already installed in this VM"
fi