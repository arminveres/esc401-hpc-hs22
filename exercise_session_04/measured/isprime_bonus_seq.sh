#!/bin/bash

# regex check for only positive integers
regex="^[0-9]*$"
seq1=$1
seq2=$2
if [[ -z $(echo $seq1 | grep $regex) ]]; then
	echo "ERROR: given range 1 is not a positive integer"
	exit 1
elif [[ -z $(echo $seq2 | grep $regex) ]]; then
	echo "ERROR: given range 2 is not a positive integer"
	exit 1
fi

for number in $(seq $seq1 $seq2); do
	output=$(factor $number | wc --words)
	corrected=$(($output - 1))

	if [[ $corrected -eq 1 ]]; then
		echo "$number is a prime"
	fi
done
