#!/bin/bash

declare string 

function isLower()
{
string=${string,,}
}

function isRoot()
{
if [ $EUID -ne 0 ]
then
	return $EUID
fi
}

function Is_user_exists()
{
id $1 1>>op 2>>err
return $?
}

echo "Enter an uppercase string to convert it to lowercase : "
read str
string=$str
isLower
echo "In lowercase : "$string



isRoot $0
if [ $? -ne 0 ]
then
	echo "Script run by normal user"
else
	echo "Script run by root"
fi

echo "Enter a username in order to find out that whether it exists or not : "
read user
Is_user_exists $user
if [ $? -ne 0 ]
then
	echo "This username doesn't exist"
else
	echo "This username exists"
fi
