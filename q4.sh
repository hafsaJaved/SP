#!/bin/bash
if [ $# -eq 0 ]
then
	echo "No filename given"
elif [ $# -gt 1 ]
then
		echo "Please give one filename only"
else
		num=`cat $1|wc -l`
		count=0
		cat $1 | while read LINE1
		do
			i=0
			cat $1 | while read LINE2
			do
			i=`expr $i + 1`
			if [ "$LINE1" = "$LINE2" ]
			then
			count=`expr $count + 1`
			
			
			fi
			if [ $i -eq $num ]
			then
			if [ $count -eq 1 ]
			then
			echo $LINE1 >> newFile
			fi
			fi

			done
			
		
		done
fi
