#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"

LogFile_Folder="/var/log/script-log"
LogFile=$(echo $0 | Cut -d "." -f1)
TIMESTAMP=$(date +%y-%m-%s-%H-%M-%S)
LogFile_Name="$LogFile_Folder/$LogFile-$TIMESTAMP.log"

VALIDATE()
{
    if [ $1 -ne 0 ]
    then 
        echo -e " $R $2 instalation failed"
        exit 1
    else
        echo -e "$G $2 Instalation Success"
    fi
}

Check_Root()
{
    if [$USERID -ne 0 ]
    then
        echo -e "$R User Can't Run the Package"
    fi
}

echo -e "$R Packages Iinstalled at : $G $TIMESTAMP" &>>LogFile
Check_Root
for PACKAGE in $@
do
    dnf list installed $PACKAGE
    if [ $? -ne 0 ]
    then
        echo -e "$G User can Install the $PACKAGE" &>> LogFile
        dnf install $PACKAGE -y
        VALIDATE $? "INstalation $PACKAGE" &>>LogFile
    else
        echo -e "$R Already $PACKAGE Installed in this VM" &>> LogFile
    fi
done

