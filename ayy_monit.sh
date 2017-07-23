#!/bin/bash
thr=50
while :
do
	ps aux | sort -k 3 -r -n | head -n 10 > temp
	cat temp | while read line
	do
		per_cpu=$(echo $line | awk '{print $3}')
		c=$(echo "$per_cpu > $thr" | bc)
		if [ "$c" -eq 1 ]; then
			user_name=$(echo $line | awk '{print $1}')
			if [ "$user_name" == "ayy" ];then
				task_pid=$(echo $line | awk '{print $2}')
				kill -s 9 $task_pid
				echo "Kill the task!" >> kill_log
				echo $(date) >> kill_log
				echo "user: $user_name" >> kill_log
				echo $line | awk '{print $11}' >> kill_log
				echo >> kill_log
			else
				echo "Can't kill the SYSTEM task, sorry~"
				echo $(date) >> kill_log
				echo $line | awk '{print $11}' >> kill_log
				echo >> kill_log
			fi
		else
			echo "System is OK" >> kill_log
			echo $(date) >> kill_log
			echo >> kill_log
			break
		fi

	done
	sleep 5
done
