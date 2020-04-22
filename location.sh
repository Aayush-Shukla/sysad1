#!/bin/bash

echo "0 0  * * *  $(pwd)/update.sh" | crontab -

army="Army"
navy="Navy"
air="AirForce"
count=1
while [ $count -le 50   ]
do
    touch "/home/$army$count/post_alloted.txt"
    touch "/home/$navy$count/post_alloted.txt"
    touch "/home/$air$count/post_alloted.txt"
    ((count++))
done






echo All Operations Finished
 
