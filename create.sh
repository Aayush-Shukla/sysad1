#!/bin/bash


m=$(pwd)

useradd -m ChiefCommander
useradd -m ArmyGeneral
useradd -m NavyMarshal
useradd -m AirForceChief
army="Army"
navy="Navy"
air="AirForce"
count=1
while [ $count -le 50   ]
do
    useradd -m "$army$count"
    useradd -m "$navy$count"
    useradd -m "$air$count"
    ((count++))
done

echo "alias record="$m/record.sh"" >> /home/ArmyGeneral/.bashrc
echo "alias record="$m/record.sh"" >> /home/NavyMarshal/.bashrc
echo "alias record="$m/record.sh"" >> /home/AirForceChief/.bashrc

echo All Operations Finished
