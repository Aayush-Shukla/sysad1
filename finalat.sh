 #!/bin/bash
 
 touch /home/ChiefCommander/attendance_report.txt
 
 
 
 paste `dirname $0`/sysad-task1-attendance.log | awk '{print substr($1,2,10),$2,$3}' > /home/ChiefCommander/attendance_report.txt
