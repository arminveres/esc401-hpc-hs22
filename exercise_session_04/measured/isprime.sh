#!/bin/bash

# regex check for only positive integers
regex="^[0-9]*$"
#storing the number to be checked
number=$1
if [[ -z $(echo $number | grep $regex) ]]; then
	echo "ERROR: given number is not a positive integer"
	exit 1
fi

output=$(factor $number | wc --words)
corrected=$(($output-1))

if [[ $corrected -gt 1 ]]; then
	echo "$number is a composite"
else
	echo "$number is a prime"
fi
