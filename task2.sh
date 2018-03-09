#!/bin/bash

if [ $# -eq 0 ]
then
	echo "NO ARGUMENT PASSED "
else
	a=$1
	set `pidof $1`
	cd /proc/$1
	set `head status`
	if [ $7 = "(sleeping)" ]
	then
		echo "Name : $a"
		echo "State : Sleeping"
		shift 7
		echo "PID : $6"
		echo "PPID : $8"
	else
		echo "Name : $a"
		echo "State : Running"
		shift 7
		echo "PID : $6"
		echo "PPID : $8"
	fi
	
fi
