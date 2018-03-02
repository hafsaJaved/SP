if [ $# -eq 5 ]

then

	arg1=$1
	if [ $arg1 = -c ]
	then
	
		file1=$2
		user1=$3
		file2=$4
		user2=$5
		set `ls -li $file1`
	
		echo $file1 "info : "
		echo "OWNER : " $4	
		echo "GROUP : " $5
		echo "PERMISSIONS : " $2
	
	
		if [ $4 = $user1 ]
		then
			cheating1=0
			set `ls -li $file2`
			if [ $4 = $user2 ]
			then
				cheating2=0
				diff $file1 $file2
				if [ $? -eq 0 ]
				then
					cheating1=1
					cheating2=1
				else
					cheating1=0
					cheating2=0
				fi
			else
				cheating2=1
			fi

		else
			cheating1=1
		fi

		echo "CHEATING : $cheating1"
		echo $file2 "info : "
		echo "OWNER : " $4	
		echo "GROUP : " $5
		echo "PERMISSIONS : " $2
		echo "CHEATING :" $cheating2
	fi	

fi
