#!/bin/bash
while :
do
	per_cpu=$(ps aux | sort -k 3 -r -n | awk 'NR==1{print}' | awk '{print $3}')
	c=$(echo "$per_cpu > 20" | bc)
	#per_cpu=$(expr $per_cpu + 0)
	#per_mem=$(ps aux | sort -k 4 -r -n | awk 'NR==1{print}' | awk '{print $1}')
	user_name=$(ps aux | sort -k 3 -r -n | awk 'NR==1{print}' | awk '{print $1}')
	if [ "$user_name" == "ayy" ]; then
		if [ "$c" -eq 1 ]; then
			task_pid=$(ps aux | sort -k 3 -r -n | awk 'NR==1{print}' | awk '{print $2}')
			kill -s 9 $task_pid
			echo "already killed the first task"
		fi
	else
		echo "System is fine"
	fi
	echo "running..."
	sleep 5
done