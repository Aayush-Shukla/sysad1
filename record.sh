#!/bin/bash

a=$(whoami)
x=$(expr 7 - $1)



if [ $a == 'ArmyGeneral' ]
then
    paste `dirname $0`/sysad-task1-attendance.log | grep $(date -dlast-sunday"-$x days" +"%Y-%m-%d") | grep Army | awk '{print $2,$3}'

elif [ $a == 'NavyMarshal' ]
then
    paste `dirname $0`/sysad-task1-attendance.log | grep $(date -dlast-sunday"-$x days" +"%Y-%m-%d") | grep Navy | awk '{print $2,$3}'

elif [ $a == 'AirForceChief' ]
then
    paste `dirname $0`/sysad-task1-attendance.log | grep $(date -dlast-sunday"-$x days" +"%Y-%m-%d") | grep AirForce | awk '{print $2,$3}'

else

    echo You dont have permission! 

fi
