#!/bin/bash






paste `dirname $0`/sysad-task1-attendance.log | grep $(date +"%Y-%m-%d") | grep AirForce | awk '{print $2,$3}' > /home/AirForceChief/attendance_record.txt

paste `dirname $0`/sysad-task1-attendance.log | grep $(date +"%Y-%m-%d") | grep Army | awk '{print $2,$3}' > /home/ArmyGeneral/attendance_record.txt

paste `dirname $0`/sysad-task1-attendance.log | grep $(date +"%Y-%m-%d") | grep Navy | awk '{print $2,$3}' > /home/NavyMarshal/attendance_record.txt
