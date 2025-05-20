#!/bin/bash

USERID=$(id -u)

VALIDATE()
{
    if [ $1 -ne 0 ]
    then
        echo "$2 not installed"
        exit 1
    else
        echo "$2 Deployed properly"
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
    echo "MYSQL Software already installed in this VM"
fi
 dnf list installed git 

if [ $? -ne 0 ]
then
    echo "Allowed to instsall git"
    dnf install git -y
    VALIDATE $? "GIT PACKAGE"
else 
    echo "GIT Software already installed in this VM"
fi