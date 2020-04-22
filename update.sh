#!/bin/bash

army="Army"
navy="Navy"
air="AirForce"
count=1
while [ $count -le 50   ]
do
     echo -e "$(date -d "+1day" +"%Y-%m-%d" ) \t $(cat `dirname $0`sysad-task1-position.log | grep $(date -d "+1day" +"%Y-%m-%d" )|grep -w $army$count | awk '{print $3,$4}')" > /home/$army$count/post_alloted.txt
     echo -e "$(date -d "+1day" +"%Y-%m-%d" ) \t $(cat `dirname $0`sysad-task1-position.log | grep $(date -d "+1day" +"%Y-%m-%d" )|grep -w $navy$count | awk '{print $3,$4}')" > /home/$navy$count/post_alloted.txt
     echo -e "$(date -d "+1day" +"%Y-%m-%d" ) \t $(cat `dirname $0`sysad-task1-position.log | grep $(date -d "+1day" +"%Y-%m-%d" )|grep -w $air$count| awk '{print $3,$4}')" > /home/$air$count/post_alloted.txt





    ((count++))
done
echo All Operations Finished
