#!/bin/bash
if [ $# -eq 0 ]
then
	echo "No file name given"
elif [ $# -gt 1 ]
then
	echo "Give one filename only"
else
	i=0
	cat $1 | while read LINE
	do
		if [ $i -eq 0 ]
			then
			echo $LINE >> oddFile
			i=1
			else
			echo $LINE >> evenFile
			i=0
		fi
	done
fi

