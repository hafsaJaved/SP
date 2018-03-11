#!/bin/bash

ls *.* 1>op 2>err
if [ $? -eq 0 ]
then
	for i in `ls *.*`
	do
		var=${i##*.}
		[ -d $var ]
		if [ $? -eq 1 ]
		then
			mkdir $var
		fi
			for j in `ls *.*`
			do
				if [ ${j##*.} = $var ]
				then
				mv $j $var
				fi
			done
	
	done
fi

