#!/bin/bash

deg2rad () {
	bc -l <<< "$1 * 0.0174532925"
}

rad2deg () {
	bc -l <<< "$1 * 57.2957795"
}

acos () {
	pi="3.141592653589793"
	bc -l <<<"$pi / 2 - a($1 / sqrt(1 - $1 * $1))"
}

distance () {
	lat_1="$1"
	lon_1="$2"
	lat_2="$3"
	lon_2="$4"
	delta_lat=`bc <<<"$lat_2 - $lat_1"`
	delta_lon=`bc <<<"$lon_2 - $lon_1"`
	lat_1="`deg2rad $lat_1`"
	lon_1="`deg2rad $lon_1`"
	lat_2="`deg2rad $lat_2`"
	lon_2="`deg2rad $lon_2`"
	delta_lat="`deg2rad $delta_lat`"
	delta_lon="`deg2rad $delta_lon`"

	distance=`bc -l <<< "s($lat_1) * s($lat_2) + c($lat_1) * c($lat_2) * c($delta_lon)"`
	distance=`acos $distance`
	distance="`rad2deg $distance`"
	distance=`bc -l <<< "$distance * 60 * 1.15078"`
	distance=`bc <<<"scale=4; $distance / 1"`
	echo $distance
}

touch /home/ChiefCommander/nearest10.txt

echo -n "">/home/ChiefCommander/nearest10.txt

declare -a dist
x=28.7041
y=77.1025
count=1
filled=0
while [ $count -le 50   ]
do
   
	if [ $(paste `dirname $0`/sysad-task1-attendance.log | grep $(date +"%Y-%m-%d") | grep -w Army$count | awk '{print $3}') == 'YES' ]
	then
		a=$(paste `dirname $0`/sysad-task1-position.log | grep $(date +"%Y-%m-%d") | grep -w Army$count | awk '{print substr($3,3,8)}')
		b=$(paste `dirname $0`/sysad-task1-position.log | grep $(date +"%Y-%m-%d") | grep -w Army$count | awk '{print substr($4,3,8)}')
		g=$(distance $x $y $a $b)
		dist[$filled]=$(echo -e "$g\tArmy$count\t$(date +"%Y-%m-%d")")
		((filled++))

		fi

		((count++))

	done



co=0
arlen=${#dist[*]}

readarray -t sorted < <(
    while [ $co -lt $arlen ]; 
    do 
        echo -e "$(echo ${dist[co]} | awk '{print $1}') \t$(echo ${dist[co]} | awk '{print $2}')\t$(echo ${dist[co]} | awk '{print $3}')" && ((co++)); 
    done | sort -n)



count=0

while [ $count -le 9 ]
do
	echo -e "$(echo ${sorted[$count]}| awk '{print $3}')\t$(echo ${sorted[$count]}|awk '{print $2}')" >>/home/ChiefCommander/nearest10.txt
	((count++))
done


