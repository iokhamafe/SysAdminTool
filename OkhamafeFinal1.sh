#!/bin/bash
#Final Script 1



while true
 do
echo -------------------------------------------------------------
echo "	       SysAdmin MoniTool              "
echo "		-------------              "
echo "Server name: $(hostname)   "
echo "Server IP address: $(hostname -i)"
echo "Person currently running script: $(whoami)"
echo "Current Number of users: $(who | wc -l) "
echo "Date and Time: $(date -R)"
cat /proc/sys/kernel/{ostype,osrelease,version}
echo "Kernel Version: $(uname -mrs)" 

echo -------------------------------------------------------------
echo "Welcome to the Admin Utility Tool."
echo "Please select from the current following options below:"
echo "1. List currently logged in users"
echo "2. List all active processes for a user" 
echo "3. Monitor active processes for a user (press q to quit monitoring user)"
echo "4. Kill a process"
echo "5. Show the last 10 users logged in."
echo "6. Show free disk space ond memory in gigabytes on system."
echo "7. Show free disk space in a User's home directory."
echo "8. Show files greater than 100MB on the system."
echo "9. Live Monitor" 
echo "10. Exit"
read -r -p "Please enter your choice from above [1 - 10]:" choice

case $choice in

1)
  
  echo "Current logged in users:"
  w
  ;;

2)
  
  echo -n "Enter a user whom you would like to see current active processes for: " 
  read user
  ps -f -u $user
  ;;

3)
  
  echo -n "Enter a user name you would like to actively monitor (press q to quit out of monitoring): "
  read usr_name
  top -U $usr_name
  ;;

4)
  
  echo -n "Please enter a PID (Process ID) to kill: "
  read process_id
  kill SIGTERM $process_id
  ;;

5)
  
  echo "Here are the last 10 users logged in: "
  last -n 10
  ;;

6)
  
  echo "Disk space and memory used on the system are below:"
  df -h
  echo "Amount of Memory on your system in gigabytes:"
  free -g
  ;;

7)
  
  echo -n "Please enter the user's directory that you would like to see the available disk space for: "
  read user_name
  echo "The Amount of disk space for $user_name home directory is specified below: "
    df -h /home/$user_name 
  ;;

8)
  
  echo "Below are files larger than 100 megabytes:"
     sudo find / -type f -size +100M
  ;;

9)
 
   
 ./OkhamafeFinal2.sh #call for second script
  
  ;;

10)
   echo "Thanks for using My SysAdmin Monitool" 
   break
  ;;

*)
   
   echo "Invalid Input! Please choose a number from 1 - 10, Thanks!"  
   ;;


esac
done
