#!/bin/bash
m=$(pwd)


echo "alias sudo="\'sudo \'"" >> ~/.bashrc

echo "alias userGenerate="$m/create.sh"" >> ~/.bashrc
echo "alias permit="$m/permission.sh"" >> ~/.bashrc 
echo "alias autoSchedule="$m/location.sh"" >> ~/.bashrc
echo "alias attendance="$m/updatechief.sh"" >> ~/.bashrc 
echo "alias finalattendance="$m/finalat.sh"" >> ~/.bashrc 
echo "alias nearest="$m/near.sh"" >> ~/.bashrc 



