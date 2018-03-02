#!/bin/bash
if [ $# -eq 0 ]
then
read -p "Enter 1st no : " n1
read -p "Enter 2nd no : " n2
else

n1=$1
n2=$2
fi
echo "SUM : "
expr $n1 + $n2 2>err.txt
if [ $? -eq 0 ]
then
echo "DIFFERENCE : "
expr $n1 - $n2
echo "PRODUCT : "
expr $n1 \* $n2
if [ $n2 -ne 0 ]
then
echo "DIVISION : "
expr $n1 / $n2


echo "MOD : "
expr $n1 % $n2

else
echo "Math Error"
fi
else
echo "Not possible"
echo "Invalid arguments"
fi
