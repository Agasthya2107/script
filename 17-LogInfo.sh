#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"

Log_File_Folder_Name="/var/log/shellscript-logs"
Log_File=$(echo $0 |cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
Log_File_Name="$Log_File_Folder_Name/$Log_File-$TIMESTAMP.log"

VALIDATE()
{
    if [ $1 -ne 0 ]
    then
        echo -e "$R instalation failed of $2"
        exit 1
    else
        echo -e "$G $2 Instslation is done"
    fi
}
CheckROOT()
{
    if [ $USERID -ne 0 ]
    then
        echo "User Doesn't have super user power"
    fi
}
echo "Package instalation started at : $TIMESTAMP" &>>Log_File_Name
CheckROOT
for package in $@
do 
    dnf list installed $PACKAGE &>>Log_File_Name
    if [ $? -ne 0 ]
    then
        echo -e "$G Good to install package"
        dnf install $package -y &>>Log_File_Name
        VALIDATE $? "Installing $Package"
    else
        echo -e "$Y Already $Package avaliable"
    fi
done