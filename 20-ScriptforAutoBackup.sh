#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # if user is not providing number of days, we are taking 14 as default

LOGS_FOLDER="/home/ec2-user/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

USAGE(){
    echo -e "$R USAGE:: $N sh 18-backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS(Optional)>"
   # echo -e "$R USAGE:: $N backup <SOURCE_DIR> <DEST_DIR> <DAYS(Optional)>"
    exit 1
}

mkdir -p /home/ec2-user/shellscript-logs

if [ $# -lt 2 ]
then
    USAGE
fi

if [ ! -d "$SOURCE_DIR" ]
then
    echo -e "SOURCE_DIR folder doesn't exit"
    exit 1
fi

if [ ! -d "$DEST_DIR" ]
then
    echo -e "DEST_DIR folder doesn't exit"
    exit 1
fi

echo "Execution of this script started at : $IMESTAMP" &>>$LOG_FILE_NAME

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS) &>>$LOG_FILE_NAME

if [ -n "$FILES" ] 
then
    echo "Files are avaliable before 14 Days:- $FILES"
    ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip" &>>$LOG_FILE_NAME
    echo -e "After Zip the file : $ZIP_FILE"
    find $SOURCE_DIR -name "*.log" -mtime +$DAYS | zip -@ "$ZIP_FILE" &>>$LOG_FILE_NAME
    if [ -f "$ZIP_FILE" ]
    then
        echo -e "$ $G Files sussefully converted to zip: $ZIP_FILE"
        while readline -r Filepath &>>$LOG_FILE_NAME
        do 
            echo -e "Deleting the files from the folder: $Filepath"
            rm -rf* $Filepath &>>$LOG_FILE_NAME
            echo -e "$R Files deleted from the $N path: $Filepath"
        done <<< $FILES &>>$LOG_FILE_NAME
    else
        echo "Failed to convert files to zip: $ZIP_FILE" &>>$LOG_FILE_NAME
        exit 1
    fi
else
    echo "No files found before 14 Days" &>>$LOG_FILE_NAME
fi