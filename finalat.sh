#!/bin/bash
 
touch /home/ChiefCommander/attendance_report.txt

if [ $(date +"%H") -lt 6 ]
    then
    dat=$(date +"%Y-%m-%d")
    
    else
    dat=$(date -d "+1day" +"%Y-%m-%d")
fi
    
 
sed -ne "/2020-04-11/,/$dat/{/$dat/d; p}" sysad-task1-attendance.log | awk '{print substr($1,2,10),$2,$3}'> /home/ChiefCommander/attendance_report.txt

