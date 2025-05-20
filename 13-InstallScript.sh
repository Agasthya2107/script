#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then 
    echo "User trying to install application without admin rights"
    exit 1
if