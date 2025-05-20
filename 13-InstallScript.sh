#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0]
then 
    echo "User trying to install application without admin rights"
else
    echo "User logged with admin account"
if