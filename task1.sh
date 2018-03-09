#!/bin/bash

table ()
{

	if [ $4 ="-r" ]
	then

	for i in `seq $1 $2`
	do
		echo "$3 * $i = `expr $3 \* $i`" 
		
	done
	
	
	else

	i=$2
	while [ $i -ge $1 ]
	do
		echo "$3 * $i = `expr $3 \* $i`"
		i=`expr $i - 1`
	done	

	fi
}


if [ $# -eq 0 ]
then
	echo "No argument passed"
	exit 0
elif [ $# -gt 6 ]
then
	echo "Arguments are more than 6"
	exit 1
elif [ $# -eq 1 ]
then
	x=`expr $1+1 2> /dev/null`
	if [ $? -ne 0 ]
	then
		echo "Invalid argument"
		exit 2
	fi
	end=10
	start=1
	table $start $end $1
elif [ $# -eq 3 ]
then
	if [ $2 = "-s" ]
	then
		table $3 10 $1
	elif [ $2 = "-e" ]
	then
		table 1 $3 $1
	fi

elif [ $# -eq 5 ]
then
	if [ $2 = "-s" -a $4 = "-e" ]
	then
		table $3 $5 $1
	fi
else
	
		table $3 $5 $1 $6
		
fi
