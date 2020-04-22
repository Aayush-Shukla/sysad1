#!/bin/bash
chmod 700 /home/ChiefCommander
chmod 700 /home/ArmyGeneral
chmod 700 /home/NavyMarshal
chmod 700 /home/AirForceChief
setfacl -m u:ChiefCommander:rwx /home/ArmyGeneral
setfacl -m u:ChiefCommander:rwx /home/NavyMarshal 
setfacl -m u:ChiefCommander:rwx /home/AirForceChief 

army="Army"
navy="Navy"
air="AirForce"
count=1
while [ $count -le 50   ]
do
    
    chmod 700 "/home/$army$count"
    setfacl -m u:ArmyGeneral:rwx "/home/$army$count"
    setfacl -m u:ChiefCommander:rwx "/home/$army$count"
    chmod 700 "/home/$navy$count"
    setfacl -m u:NavyMarshal:rwx "/home/$navy$count"
    setfacl -m u:ChiefCommander:rwx "/home/$navy$count"
    chmod 700 "/home/$air$count"
    setfacl -m u:AirForceChief:rwx "/home/$air$count"
    setfacl -m u:ChiefCommander:rwx "/home/$air$count"
    
    
    
    
    
    ((count++))
done
echo All Operations Finished
