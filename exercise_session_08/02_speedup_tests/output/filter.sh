#!/bin/bash -e

echo "threads,gridsize,time" > omp.dat
for file in timed_omp*.err; do
	filename="$(echo "$file")"
	filename=$(echo $filename | sed --expression='s/timed_omp_//')
	filename=$(echo $filename | egrep -oe '[0-9]*')
	threads=$(echo $filename | awk '{print $1}')
	gridsize=$(echo $filename | awk '{print $2}')
	time=$(cat $file | egrep real | awk '{print $2}')
	# echo $time
	echo $threads,$gridsize,$time >>omp.dat
done


echo "threads,gridsize,time" > mpi.dat
for file in timed_mpi*.err; do
	filename="$(echo "$file")"
	filename=$(echo $filename | sed --expression='s/timed_mpi_//')
	filename=$(echo $filename | egrep -oe '[0-9]*')
	threads=$(echo $filename | awk '{print $1}')
	grid=$(echo $filename | awk '{print $2}')
	time=$(cat $file | egrep real | awk '{print $2}')
	# echo $time
	echo $threads,$grid,$time >>mpi.dat
done
