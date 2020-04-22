#!/bin/bash
userdel -r ChiefCommander
userdel -r ArmyGeneral
userdel -r NavyMarshal
userdel -r AirForceChief
army="Army"
navy="Navy"
air="AirForce"
count=1
while [ $count -le 50   ]
do
    userdel -r "$army$count"
    userdel -r "$navy$count"
    userdel -r "$air$count"
    ((count++))
done
echo All Operations Finished
