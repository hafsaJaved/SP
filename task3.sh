#!/bin/bash
showAllOwners ()
{
owner=$1
for i in `ls`
do
	
	if [ -f $i ]
	then
		set `ls -li $i`
		if [ $4 = $owner ]
		then
			shift 1
			echo "$9 | `file $9` | $owner"
		fi
	fi
done
}
if [ $# -eq 0 ]
then
	echo "No ARGUMENT PASSED"
elif [ $# -eq 1 ]
then
	
	showAllOwners $1
fi
