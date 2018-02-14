read -p "Define threshold for high usage value " X # take threshold value from user for one minute load average 
read -p "Define another threshold for very high usage value " Y  # take threshold value from user for 5 minute load average 
counter=0
while sleep 10; do 
date=$(date +"%T");
loadavg=$(uptime | awk -F'load average: ' '{print $2}'); # extracts just the load average from the uptime 
echo "${date}, ${loadavg}" >> loadingavg3.csv; # logs the load average in a csv file 
counter=$((counter+1))


first=$(uptime |tr -d ','| awk '{print$9}'); # extracts the one minute load average from uptime 


var=$(awk 'BEGIN{ print "'$X'"<"'$first'" }') 


if [ "$var" -eq 1 ];then
	echo "${date}, HIGH CPU usage, ${first}" 
echo "${date}, HIGH CPU usage, ${first}" >> highcpuusagen.csv; # extracts the 5 minute load average from uptime 

fi



second=$(uptime |tr -d ','| awk '{print$10}'); # extracts the 5 minute load average from uptime 




var2=$(awk 'BEGIN{ print "'$Y'"<"'$second'" }') 
if [ "$var2" -eq 1 ];then
	
	echo "${date}, Very HIGH CPU usage, ${second}" 
echo "${date}, Very HIGH CPU usage, ${second}"  >> highcpuusagep.csv;
	


	.
fi;

if [ "$counter" -eq 360 ];then 
	echo `rm loadingavg3.csv` 
	counter=0

fi;


done 

