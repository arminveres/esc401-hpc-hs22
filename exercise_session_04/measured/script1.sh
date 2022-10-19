#!/bin/bash

# for files in folder:
#   grep for temp and awk it into two columns
# put all into an out.txt file
# for average, take each value in the for loop and sum it up, while diving with n before returning

# folder=$1
# if [[ -z $folder ]]; then
# 	echo "add a folder as an input..."
# 	exit 1
# fi

touch tmp.txt
printf "TEMPERATURE TIME\n" >tmp.txt
sum=0
for file in measurements*.txt; do
	echo "Working on $file"
	grep -i temperature $file | awk '{print $2"\t"$6}' >>tmp.txt
	temps=$(grep -i temperature $file | awk '{print $2}')
	for val in $temps; do
		sum=$(echo "$sum+$val" | bc)
	done
done
measurements=$(wc -l tmp.txt | awk '{print $1}')
echo "The average temp is: " $(echo "scale=5;$sum/$measurements" | bc)
column -t tmp.txt >out.txt
rm tmp.txt
