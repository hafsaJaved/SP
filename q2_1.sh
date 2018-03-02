#!/bin/bash
if [ $# -eq 2 ]
then
username=$1
filename=$2
set `ls -li $filename`

if [ $4 = $username ]
then
echo "CHEATING = 0"
else
echo "CHEATING = 1"
fi
else
echo "Error in arguments"
fi
