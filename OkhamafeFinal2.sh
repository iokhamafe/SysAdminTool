#!/bin/bash
#Called function from original project

#The Live monitor choice should call a second script which shows the current time, CPU utilization, current memory utilization, current disk space utilization, and currently logged in users. The script should refresh every 5 seconds until the user presses a key.

#This script is a called script from the main OkhamafeFinal1.sh script. It shows current time, cpu utlization, current memory utilization, current disk space utilization, and currently logged in users, script should refresh every 5 seconds


keyinput=''

while true; do
  
   echo "Press Any Number or Letter to Exit."
   echo "Time: $(date -R)"
   echo "Users currently logged on:"
       w #Display who is currently logged on
   echo "Disk space utilization:"
       df -h #Display disk space utilization in human readable form
   echo "Memory and CPU Utilization:"
       ps axo user,pmem,pcpu #Display Username, % of Memory Used, CPU Usage %

   read -t 0.0001 -n 1 keyinput      # use a very little time to input. 
   
   case $keyinput in
        [a-z]|[A-Z]|[0-9] ) kill -SIGINT $$ #Interrupt the Program and return to the main program/menu (This is the equilvalent of ctrl - C). The $$ takes place of the called program. 
		;;    	
   esac
sleep 5 #Refresh Script every 5 seconds
done


