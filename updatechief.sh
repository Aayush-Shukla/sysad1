#!/bin/bash
touch "/home/ArmyGeneral/attendance_record.txt"
touch "/home/NavyMarshal/attendance_record.txt"
touch "/home/AirForceChief/attendance_record.txt"

(crontab -l && echo "0 6  * * *  $(pwd)/update2.sh" ) | crontab -

