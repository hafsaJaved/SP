	
if [ $# -eq 1 ]
then
	array=(`cat $1`) 2>err.txt
	if [ $? -eq 0 ]
	then
		echo "Length : " ${#array[@]}
		echo "Array values : "
		echo ${array[@]}
		echo "Length of the content at 3rd index : "
		echo ${#array[3]}
	else
	cat err.txt
	fi
else
	echo "No arguments provided"
fi
