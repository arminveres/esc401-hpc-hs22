#!/bin/bash -e

echo "no_particles,time_taken" >omp.dat
for file in scaling_nbody_omp*; do
	filename="$(echo "$file")"
	filename=$(echo $filename | sed --expression='s/scaling_nbody_omp_//')
	no_particles=$(echo $filename | sed --expression='s/\d*.out//')
	value=$(grep -i "ms" $file | awk '{print $5}')
	echo "$no_particles,$value" >>omp.dat
done
sort -n omp.dat >omp_table.dat

echo "no_particles,time_taken" >serial.dat
for file in scaling_nbody_serial*; do
	filename="$(echo "$file")"
	filename=$(echo $filename | sed --expression='s/scaling_nbody_serial_//')
	no_particles=$(echo $filename | sed --expression='s/\d*.out//')
	value=$(grep -i "ms" $file | awk '{print $5}')
	echo "$no_particles,$value" >>serial.dat
done
sort -n serial.dat >serial_table.dat

python3 ./plot.py # /opt/cray/pe/python/3.9.12.1/bin/python3
